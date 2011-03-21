require 'helper'
require 'rjb'

class TestStyle < Test::Unit::TestCase
  include POIPond
  context "style" do
    setup do
      initialize_poi
    end
    
    should "get POI dark blue color index" do
      assert_equal Rjb::import('org.apache.poi.ss.usermodel.IndexedColors').DARK_BLUE.getIndex, poi_color('DARK_BLUE')
    end
    
    should "return -1 if color isn't found" do
      assert_equal -1, poi_color('foo')
    end
    
    should "return a cellStyle object" do
      assert_equal Rjb::import('org.apache.poi.ss.usermodel.CellStyle').ALIGN_LEFT, excel_cell_style.ALIGN_LEFT
    end
    
    should "return a hssfCellStyle object" do
      assert Rjb::import('org.apache.poi.hssf.usermodel.HSSFCellStyle').ALIGN_CENTER, hssf_cell_style.ALIGN_CENTER
    end
    
  end  
end