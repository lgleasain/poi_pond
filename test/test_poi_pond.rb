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
  end
  
  context "style" do
    setup do
      POIPond.initialize
    end
    
    should "set POI colors" do
      
    end
  end
end
