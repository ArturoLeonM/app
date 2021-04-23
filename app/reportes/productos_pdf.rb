class ProductosPdf

  def call
    Prawn::Document.new( 
      page_size:'EXECUTIVE'   
      )do
      stroke

      bounding_box [bounds.left, bounds.top], :width  => bounds.width do
        font "Helvetica"
        text "Reporte Productos", :align => :center, :size => 15
        stroke_horizontal_rule
      end

      move_cursor_to 634

      text_box 'Id', at: [15,cursor]
      text_box 'Nombre', at: [35,cursor]
      text_box 'Descripcion', at: [155,cursor]
      text_box 'Precio', at: [300,cursor], align: :right, width: 50
      text_box 'Tipo', at: [365,cursor]
      move_down 15

      Producto.all.each do |i|
        text_box i.id.to_s, at: [15,cursor]
        text_box i.name, at: [35,cursor]
        text = text_box i.descripcion, at: [155,cursor], width: 150, height: 15,  overflow: :truncate
        text_box i.precio.to_s, at: [300,cursor], align: :right, width: 50
        text_box i.tipo.tipo, at: [365,cursor]
        move_down 15
        while text.length > 0 do
          text = text_box text, at: [155,cursor], width: 150, height: 15, overflow: :truncate
          move_down 15
        end
      end
    end
  end
end