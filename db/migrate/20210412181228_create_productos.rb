class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :name
      t.string :descripcion
      t.decimal :precio

      t.timestamps
    end
  end
end
