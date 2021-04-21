# z

class ProductosPdf

  def call
    # pdf = Prawn::Document.new
    # # pdf.text "HolaMundo"
    # pdf
    pdf = Prawn::Document.new( 
      page_size:'EXECUTIVE',  
      page_layout: :landscape
    ) do  
      text 'EXECUTIVE landscape page.'  
      custom_size =[275, 326]
      ['A4','TABLOID','B7', custom_size].each do |size|
        start_new_page(size: size, layout: :portrait)    
        text "#{size} portrait page."    
        start_new_page(size: size, layout: :landscape)    
        text "#{size} landscape page."  
      end
    end
    pdf
  end
end