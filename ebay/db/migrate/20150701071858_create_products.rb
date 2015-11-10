class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_details
      t.integer :product_no

      t.timestamps null: false
    end
  end
end
