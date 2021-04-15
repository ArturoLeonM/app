json.extract! producto, :id, :name, :descripcion, :precio, :created_at, :updated_at
json.url producto_url(producto, format: :json)
