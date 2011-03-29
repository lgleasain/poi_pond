require 'rjb'
require 'style'

module POIPond
  include Style
  def initialize_poi 
    dir = File.join(File.dirname(File.dirname(__FILE__)), 'javalibs')
    if File.exist?(dir)
      jardir = File.join(File.dirname(File.dirname(__FILE__)), 'javalibs', '**', '*.jar')
    else
      jardir = File.join('.','javalibs', '**', '*.jar')
    end
    Rjb::load(classpath = Dir.glob(jardir).join(':'), jvmargs=['-Djava.awt.headless=true'])
  end
  
  def create_excel_workbook(file = nil)
    file ? Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new(file) : Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new
  end
  
  def create_excel_cell_range_address
    Rjb::import('org.apache.poi.ss.util.CellRangeAddress')
  end
  
  def hssf_data_format
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat')
  end
  
  def poi_output_file(file)
    Rjb::import('java.io.FileOutputStream').new(file)
  end

  def poi_input_file(file)
    Rjb::import('java.io.FileInputStream').new(file)
  end
  
  def add_photo_to_sheet(workbook, sheet, row, column, image)
    picture_index = workbook.addPicture image, workbook.PICTURE_TYPE_JPEG
    drawing = workbook.getSheet(sheet).createDrawingPatriarch
    anchor = workbook.getCreationHelper.createClientAnchor
    anchor.setCol1 column
    anchor.setRow1 row
    drawing.createPicture(anchor, picture_index).resize
  end
  
  def create_spreadsheet(options)
    workbook = create_excel_workbook
    options.each do |sheet_hash|
      sheet = workbook.createSheet sheet_hash[:sheet][:name]
      sheet.setPrintGridlines(!!sheet_hash[:sheet][:print_grid_lines]) 
      sheet.setDisplayGridlines(!!sheet_hash[:sheet][:display_grid_lines])
      if sheet_hash[:sheet][:merged_regions]
        sheet_hash[:sheet][:merged_regions].each do |merged_region|
          sheet.addMergedRegion create_excel_cell_range_address.new(merged_region[:start_row] - 1, merged_region[:end_row] - 1,
                                                                    merged_region[:start_column] - 1, merged_region[:end_column] - 1)
        end
      end
      if sheet_hash[:sheet][:row] 
        sheet_hash[:sheet][:row].each do |row_hash|
          row = sheet.createRow row_hash[:row_index]
          if row_hash[:cell]
            row_hash[:cell].each do |cell_hash|
              cell = row.createCell cell_hash[:cell_index]
              cell_hash[:value] ? cell.setCellValue(cell_hash[:value]) : nil
            end
          end
        end
      end 
    end
    workbook
  end  
end 