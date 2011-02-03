class CreateProductsInfos < ActiveRecord::Migration
  def self.up
    create_table :products_infos do |t|
      t.string :description
      t.string :valueType
      t.string :value
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :products_infos
  end
end
