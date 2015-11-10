class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :brand_id, :integer
    add_index :products, :brand_id
    add_column :products, :category_id, :integer
    add_index :products, :category_id
  end
end
