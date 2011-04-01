require 'helper'
require 'rjb'

class TestStyle < Test::Unit::TestCase
  include POIPond
  context "style" do
    setup do
      initialize_poi
    end
    
    context "class function" do
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
    end
    
    context "font" do
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
    
      should "set the font weight to bold" do
        my_font = create_cell_style(create_excel_workbook, {:bold => true}).get_font
        assert_equal my_font.BOLDWEIGHT_BOLD, my_font.getBoldweight
      end
    
      should "not set the font to bold if no bold setting is specified" do
        my_font = create_cell_style(create_excel_workbook, {}).get_font
        assert_equal my_font.BOLDWEIGHT_NORMAL, my_font.getBoldweight
      end
    end
    
    context "border" do
      should "set a left border for the cell" do
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border_left => 'BORDER_MEDIUM'}).getBorderLeft
      end
    
      should "not set a left border for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderLeft,
                      create_cell_style(create_excel_workbook, {:border_left => 'foo'}).getBorderLeft
      end

      should "set a right border for the cell" do
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border_right => 'BORDER_MEDIUM'}).getBorderRight
      end
    
      should "not set a right border for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderRight,
                      create_cell_style(create_excel_workbook, {:border_right => 'foo'}).getBorderRight
      end

      should "set a top border for the cell" do
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border_top => 'BORDER_MEDIUM'}).getBorderTop
      end
    
      should "not set a top border for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderTop,
                      create_cell_style(create_excel_workbook, {:border_top => 'foo'}).getBorderTop
      end

      should "set a bottom border for the cell" do
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border_bottom => 'BORDER_MEDIUM'}).getBorderBottom
      end
    
      should "not set a bottom border for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderBottom,
                      create_cell_style(create_excel_workbook, {:border_bottom => 'foo'}).getBorderBottom
      end

      should "set a border for the cell" do
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border => 'BORDER_MEDIUM'}).getBorderBottom
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border => 'BORDER_MEDIUM'}).getBorderTop
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border => 'BORDER_MEDIUM'}).getBorderLeft
        assert_equal excel_cell_style.BORDER_MEDIUM, create_cell_style(create_excel_workbook, {:border => 'BORDER_MEDIUM'}).getBorderRight
      end
    
      should "not set a border for a cell if none is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderBottom,
                      create_cell_style(create_excel_workbook, {:border => 'foo'}).getBorderBottom
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderTop,
                      create_cell_style(create_excel_workbook, {:border => 'foo'}).getBorderTop
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderLeft,
                      create_cell_style(create_excel_workbook, {:border => 'foo'}).getBorderLeft
        assert_equal create_cell_style(create_excel_workbook, {}).getBorderRight,
                      create_cell_style(create_excel_workbook, {:border => 'foo'}).getBorderRight
      end
      
      should "set a left border color for the cell" do
        assert_equal poi_color('DARK_BLUE'), create_cell_style(create_excel_workbook, {:border_left => 'BORDER_MEDIUM',
                                                              :border_left_color => 'DARK_BLUE'}).getLeftBorderColor
      end
    
      should "not set a left border color for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getLeftBorderColor,
                      create_cell_style(create_excel_workbook, {:border_left => 'foo', :border_left_color => 'foo'}).getLeftBorderColor
      end

      should "set a right border color for the cell" do
        assert_equal poi_color('DARK_BLUE'), create_cell_style(create_excel_workbook, {:border_right => 'BORDER_MEDIUM',
                                                              :border_right_color => 'DARK_BLUE'}).getRightBorderColor
      end
    
      should "not set a right border color for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getRightBorderColor,
                      create_cell_style(create_excel_workbook, {:border_right => 'foo', 
                                                                :border_right_color => 'foo'}).getRightBorderColor
      end

      should "set a top border color for the cell" do
        assert_equal poi_color('DARK_BLUE'), create_cell_style(create_excel_workbook, {:border_top => 'BORDER_MEDIUM',
                                                                                       :border_top_color => 'DARK_BLUE'}).getTopBorderColor
      end
    
      should "not set a top border color for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getTopBorderColor,
                      create_cell_style(create_excel_workbook, {:border_top => 'foo',
                                                                :border_top_color => 'foo'}).getTopBorderColor
      end

      should "set a bottom border color for the cell" do
        assert_equal poi_color('DARK_BLUE'), create_cell_style(create_excel_workbook, {:border_bottom => 'BORDER_MEDIUM',
                                                                                  :border_bottom_color => 'DARK_BLUE'}).getBottomBorderColor
      end
    
      should "not set a bottom border color for a cell if a invalid one is specified" do
        assert_equal create_cell_style(create_excel_workbook, {}).getBottomBorderColor,
                     create_cell_style(create_excel_workbook, {:border_bottom => 'foo', :border_bottom_color => 'foo'}).getBottomBorderColor
      end

      should "set a border color for the cell" do
        style = create_cell_style(create_excel_workbook, {:border => 'BORDER_MEDIUM', :border_color => 'DARK_BLUE'})
        assert_equal poi_color('DARK_BLUE'), style.getBottomBorderColor
        assert_equal poi_color('DARK_BLUE'), style.getTopBorderColor
        assert_equal poi_color('DARK_BLUE'), style.getLeftBorderColor
        assert_equal poi_color('DARK_BLUE'), style.getRightBorderColor
      end
    
      should "not set a border for a cell if none is specified" do
        blank_style = create_cell_style(create_excel_workbook, {})
        style = create_cell_style(create_excel_workbook, {:border => 'foo', :border_color => 'foo'}) 
        assert_equal blank_style.getBottomBorderColor, style.getBottomBorderColor
        assert_equal blank_style.getTopBorderColor, style.getTopBorderColor
        assert_equal blank_style.getLeftBorderColor, style.getLeftBorderColor
        assert_equal blank_style.getRightBorderColor, style.getRightBorderColor
      end
    end

    should "set the background color to DARK_BLUE" do
      style = create_cell_style(create_excel_workbook, {:background_color => 'DARK_BLUE'})
      assert_equal poi_color('DARK_BLUE'), style.getFillForegroundColor
      assert_equal 1, style.getFillPattern
    end
    
    should "not set a background color if a invalid one is specified" do
      style = create_cell_style(create_excel_workbook, {:background_color => 'foo'})
      assert_equal create_cell_style(create_excel_workbook, {}).getFillBackgroundColor, style.getFillBackgroundColor
      assert_equal create_cell_style(create_excel_workbook, {}).getFillPattern, style.getFillPattern
    end
    
    should "set text wrap to true" do
      assert create_cell_style(create_excel_workbook, {:wrap_text => true}).getWrapText
    end
    
    should "set indentation to 6" do
      assert_equal 6, create_cell_style(create_excel_workbook, {:indentation => 6}).getIndention
    end
  end  
end