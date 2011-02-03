class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :priceVat
      t.decimal :priceOrigin
      t.decimal :priceOriginVat
      t.datetime :expireDate
      t.boolean :expired
      t.integer :subSectionId

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
