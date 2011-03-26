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
    Rjb::load(classpath = Dir.glob(jardir).join(':'), jvmargs=[])
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
  
  def poi_file(file)
    Rjb::import('java.io.FileOutputStream').new(file)
  end
end 