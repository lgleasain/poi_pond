require 'rjb'
require 'style'

module POIPond
  include Style
  def initialize_poi 
    Rjb::load(classpath = Dir.glob('./javalibs/**/*.jar').join(':'), jvmargs=[])
  end
  
  def create_excel_workbook
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new
  end
  
  def create_excel_cell_range_address
    Rjb::import('org.apache.poi.ss.util.CellRangeAddress')
  end
  
  def hssf_data_format
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat')
  end
end 