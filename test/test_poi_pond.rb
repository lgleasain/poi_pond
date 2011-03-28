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

    context "primitive functions" do
      should "create a workbook" do
        workbook = create_excel_workbook
        assert workbook.createSheet('sheet1')
      end
    
      should "create a cell range address object" do
        assert create_excel_cell_range_address.valueOf('$A$2')
      end
    
      should "create a HSSFDataFormat object" do
        reference_built_in_format = Rjb::import('org.apache.poi.hssf.usermodel.HSSFDataFormat').getBuiltinFormat("m/d/yy h:mm")
        assert_equal reference_built_in_format, hssf_data_format.getBuiltinFormat("m/d/yy h:mm")
      end
    
      should "create a FileOutputStream object" do
        assert_equal Rjb::import('java.io.FileOutputStream').new('foo').java_methods, poi_output_file('foo').java_methods
        File.delete 'foo'
      end

      should "create a FileInputStream object" do
        poi_output_file('foo')
        assert_equal Rjb::import('java.io.FileInputStream').new('foo').java_methods, poi_input_file('foo').java_methods
        File.delete 'foo'
      end
    
      should "create a image and place it on a worksheet" do
        test_image = File.join(File.dirname(File.dirname(__FILE__)), 'test', 'image001.jpg')
        workbook = create_excel_workbook
        workbook.createSheet('sheet1')
        add_photo_to_sheet(workbook, 'sheet1', 1, 1, File.new(test_image).bytes.to_a)
        workbook.write(poi_output_file('my_test.xls'))
        read_workbook = create_excel_workbook poi_input_file('my_test.xls')
        assert_equal File.new(test_image).bytes.to_a, read_workbook.getAllPictures.get(0).getData.bytes.to_a
        File.delete 'my_test.xls'
      end        
    end
    
    context "create" do
      should "create a spreadsheet with one a sheet called sheet1" do
        assert_not_nil create_spreadsheet([:sheet => {:name => 'sheet1'}]).getSheet('sheet1')
      end
      
      should "create a spreadsheet with multiple sheets" do
        spreadsheet = create_spreadsheet([{:sheet => {:name => 'sheet1'}}, {:sheet => {:name => 'sheet2'}}])
        assert_not_nil spreadsheet.getSheet('sheet1')
        assert_not_nil spreadsheet.getSheet('sheet2')
      end
      
      should "set printGridlines to true for sheet1" do
        assert create_spreadsheet([:sheet => {:name => 'sheet1', :print_grid_lines => true}]).getSheet('sheet1').isPrintGridlines
      end
      
      should "set displayGridlines to false for sheet1" do
        assert !create_spreadsheet([:sheet => {:name => 'sheet1', :display_grid_lines => false}]).getSheet('sheet1').isDisplayGridlines
      end
      
      should "create a row 1" do
        assert create_spreadsheet([:sheet => {:name => 'sheet1', :row => [{:row_index => 1}]}]).getSheet('sheet1').getRow(1)
      end
      
      should "create row 3 and 7" do
        sheet = create_spreadsheet([:sheet => {:name => 'sheet1', :row => [{:row_index => 3}, {:row_index => 7}]}]).getSheet('sheet1')
        assert sheet.getRow(3)
        assert sheet.getRow(7)
      end
      
      should "create cell 1" do
        assert create_spreadsheet([:sheet => {:name => 'sheet1', 
                          :row => [{:row_index => 1, :cell => [{:cell_index => 1}]}]}]).getSheet('sheet1').getRow(1).getCell(1)
      end

      should "create cell 2 and 6" do
        sheet = create_spreadsheet([:sheet => {:name => 'sheet1', 
                          :row => [{:row_index => 1, :cell => [{:cell_index => 2}, {:cell_index => 6}]}]}]).getSheet('sheet1')
        assert sheet.getRow(1).getCell(2)
        assert sheet.getRow(1).getCell(6)
      end
    end
  end
end
