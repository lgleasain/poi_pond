require 'helper'
require 'rjb'

class TestStyle < Test::Unit::TestCase
  context "style" do
    setup do
      POIPond.initialize
    end
    
    should "get POI dark blue color index" do
      assert_equal Rjb::import('org.apache.poi.ss.usermodel.IndexedColors').DARK_BLUE.getIndex, Style.color('DARK_BLUE')
    end
    
    should "return -1 if color isn't found" do
      assert_equal -1, Style.color('foo')
    end
    
    should "return a cellStyle object" do
      assert_equal Rjb::import('org.apache.poi.ss.usermodel.CellStyle').ALIGN_LEFT, Style.cell_style.ALIGN_LEFT
    end
    
    should "return a hssfCellStyle object" do
      assert Rjb::import('org.apache.poi.hssf.usermodel.HSSFCellStyle').ALIGN_CENTER, Style.hssf_cell_style.ALIGN_CENTER
    end
    
  end  
end