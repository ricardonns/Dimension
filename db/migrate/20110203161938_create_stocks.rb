class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.string :name
      t.integer :quantity
      t.references :product
      t.references :size
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
