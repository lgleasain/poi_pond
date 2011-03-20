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
end 