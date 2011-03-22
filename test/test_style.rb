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
      assert_equal nil, poi_color('foo')
    end
    
    should "return a cellStyle object" do
      assert_equal Rjb::import('org.apache.poi.ss.usermodel.CellStyle').ALIGN_LEFT, excel_cell_style.ALIGN_LEFT
    end
    
    should "return a hssfCellStyle object" do
      assert Rjb::import('org.apache.poi.hssf.usermodel.HSSFCellStyle').ALIGN_CENTER, hssf_cell_style.ALIGN_CENTER
    end
    
    should "create a style with a 24 point default font" do
      assert_equal  24, create_cell_style(create_excel_workbook, {:font_height => 24}).get_font.getFontHeightInPoints
      assert_equal  'Arial', create_cell_style(create_excel_workbook, {:font_height => 24}).get_font.getFontName
    end
    
    should "create a style with a dark blue Tahoma 24 point font" do
      cell_style = create_cell_style create_excel_workbook, {:font_height => 24, :font_color => 'DARK_BLUE', :font_name => 'Tahoma'}
      assert_equal 24, cell_style.get_font.getFontHeightInPoints
      assert_equal poi_color('DARK_BLUE'), cell_style.get_font.getColor
      assert_equal 'Tahoma', cell_style.get_font.getFontName
    end
    
    should "not modify the color if a invalid one is passed" do
      assert_equal create_cell_style(create_excel_workbook, {}).get_font.getColor, 
                    create_cell_style(create_excel_workbook, {:font_color => 'foo'}).get_font.getColor
    end
    
    should "create a style with a left justified horizontal alignment" do
      assert_equal excel_cell_style.ALIGN_LEFT, 
                    create_cell_style(create_excel_workbook, {:horizontal_alignment => 'ALIGN_LEFT'}).getAlignment
    end
    
    should "not modify the horizontal alignment if a invalid one is specified" do
      assert_equal create_cell_style(create_excel_workbook, {}).getAlignment,
                    create_cell_style(create_excel_workbook, {:horizontal_alignment => 'foo'}).getAlignment
    end
    
    should "not modify the vertical alignment if a invalid one is specified" do
      assert_equal create_cell_style(create_excel_workbook, {}).getVerticalAlignment,
                    create_cell_style(create_excel_workbook, {:vertical_alignment => 'foo'}).getVerticalAlignment
    end    
    
    should "create a style with a vertical top vertical alignment" do
      assert_equal excel_cell_style.VERTICAL_TOP, 
                   create_cell_style(create_excel_workbook, {:vertical_alignment => 'VERTICAL_TOP'}).getVerticalAlignment
    end
  end  
end