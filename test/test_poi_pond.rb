require 'helper'
require 'rjb'

class TestPoiPond < Test::Unit::TestCase
  context "initialize" do
    should "initialize rjb and return a valid object" do
      POIPond.initialize
      assert_not_nil Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook').new
    end
  end
  
  context "spreadsheet" do
    setup do
      POIPond.initialize
    end
    
    should "create a workbook" do
      workbook = POIPond.create_workbook
      assert workbook.createSheet("sheet1")
    end
    
    should "create a cell range address object" do
      assert POIPond.create_cell_range_address.valueOf('$A$2')
    end
    
    should "create a HSSFDataFormat object" do
      reference_built_in_format = Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat').getBuiltinFormat("m/d/yy h:mm")
      assert_equal reference_built_in_format, POIPond.hssf_data_format.getBuiltinFormat("m/d/yy h:mm")
    end
  end
  
end
