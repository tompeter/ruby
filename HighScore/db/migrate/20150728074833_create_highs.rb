class CreateHighs < ActiveRecord::Migration
  def change
    create_table :highs do |t|
      t.string :game
      t.integer :score

      t.timestamps null: false
    end
  end
end
