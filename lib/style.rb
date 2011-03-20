module Style
  def self.color(color)
    begin
      Rjb::import('org.apache.poi.ss.usermodel.IndexedColors').send(color).getIndex
    rescue RuntimeError
      -1
    end
  end
  
  def self.cell_style
    Rjb::import('org.apache.poi.ss.usermodel.CellStyle')
  end
end