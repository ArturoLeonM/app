require 'csv'
class ProductoReporte
    def call
        @csv_string = CSV.generate do |csv|
            csv << ["id", "nombre", "descripcion", "precio", "tipo"]
            Producto.all.each do |i|
                p i
                csv << [i.id,
                i.name,
                i.descripcion,
                i.precio,
                i.tipo.tipo]
            end
            csv 
        end
        @csv_string 
    end
end