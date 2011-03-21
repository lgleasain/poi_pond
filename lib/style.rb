module Style
  def poi_color(color)
    begin
      Rjb::import('org.apache.poi.ss.usermodel.IndexedColors').send(color).getIndex
    rescue RuntimeError
      -1
    end
  end
  
  def excel_cell_style
    Rjb::import('org.apache.poi.ss.usermodel.CellStyle')
  end
  
  def hssf_cell_style
    Rjb::import('org.apache.poi.hssf.usermodel.HSSFCellStyle')
  end
end