module Style
  def poi_color color
    nil_out_runtime_error {Rjb::import('org.apache.poi.ss.usermodel.IndexedColors').send(color).getIndex}
  end
  
  def excel_cell_style
    Rjb::import('org.apache.poi.ss.usermodel.CellStyle')
  end
  
  def hssf_cell_style
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFCellStyle')
  end
    
  def create_cell_style workbook, options
    workbook_font = workbook.createFont
    style = workbook.createCellStyle
    options[:font_height] ? workbook_font.setFontHeightInPoints(options[:font_height]) : nil
    options[:font_color] && poi_color(options[:font_color]) ? workbook_font.setColor(poi_color(options[:font_color])) : nil
    options[:font_name] ? workbook_font.setFontName(options[:font_name]) : nil
    nil_out_runtime_error {options[:horizontal_alignment] ? 
                            style.setAlignment(excel_cell_style.send(options[:horizontal_alignment])) : nil}
    nil_out_runtime_error {options[:vertical_alignment] ? 
                            style.setVerticalAlignment(excel_cell_style.send(options[:vertical_alignment])) : nil}
    style.setFont workbook_font
    # next three lines are a hack to test fonts due to a rjb bug
    def style.set_font(font); @font = font; end;
    def style.get_font; @font; end;
    style.set_font workbook_font
    style
  end
  
  private 
  def nil_out_runtime_error(&block)
    begin
      block.call
    rescue RuntimeError
      nil
    end
  end
end