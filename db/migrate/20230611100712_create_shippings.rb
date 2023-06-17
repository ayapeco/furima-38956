class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :zip_code, null: false
      t.string :shipping_region_id, null: false
      t.string :shipping_city, null: false
      t.string :shipping_street, null: false
      t.string :shipping_building
      t.string :phone, null: false
      t.references :buying_record, null: false, foreign_key: true  
      t.timestamps
    end
  end
end
