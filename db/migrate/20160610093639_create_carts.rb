class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|

      #t.integer :account_id
      #t.integer :products_id

      t.belongs_to :account, index: true
      t.timestamps null: false
    end
  end
end
