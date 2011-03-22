require 'helper'
require 'rjb'

class TestPoiPond < Test::Unit::TestCase
  include POIPond
  context "initialize" do
    should "initialize rjb and return a valid object" do
      initialize_poi
      assert_not_nil Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new
    end
  end
  
  context "spreadsheet" do
    setup do
      initialize_poi
    end
    
    should "create a workbook" do
      workbook = create_excel_workbook
      assert workbook.createSheet("sheet1")
    end
    
    should "create a cell range address object" do
      assert create_excel_cell_range_address.valueOf('$A$2')
    end
    
    should "create a HSSFDataFormat object" do
      reference_built_in_format = Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat').getBuiltinFormat("m/d/yy h:mm")
      assert_equal reference_built_in_format, hssf_data_format.getBuiltinFormat("m/d/yy h:mm")
    end
    
    should "create a FileOutputStream object" do
      assert_equal Rjb::import('java.io.FileOutputStream').new('foo').java_methods, poi_file('foo').java_methods
    end
  end
  
end
