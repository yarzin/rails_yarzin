class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price

      #t.integer :cart_id

      t.belongs_to :cart, index: true
      t.timestamps null: false
    end
  end
end
