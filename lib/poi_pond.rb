require 'rjb'
require 'style'

module POIPond
  include Style
  def self.initialize 
    Rjb::load(classpath = Dir.glob('./javalibs/**/*.jar').join(':'), jvmargs=[])
  end
  
  def self.create_workbook
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new
  end
  
  def self.create_cell_range_address
    Rjb::import('org.apache.poi.ss.util.CellRangeAddress')
  end
  
  def self.hssf_data_format
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat')
  end
end 