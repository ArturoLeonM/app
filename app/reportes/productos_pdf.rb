class ProductosPdf

  def call


    Prawn::Document.new( 
      page_size:'EXECUTIVE' 
      
      )do
        repeat :all do

        bounding_box [bounds.left, bounds.top], :width  => bounds.width do
          font "Helvetica"
          text "Here's My Fancy Header", :align => :center, :size => 25
          stroke_horizontal_rule
        end
        
        bounding_box [bounds.left, bounds.bottom + 28], :width  => bounds.width do
          font "Helvetica"
          stroke_horizontal_rule
          move_down(5)
          text "Este es un sexy footer", :size => 16
        end
      end
    end
  end
end