class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :ingredient1
      t.string :ingredient2
      t.string :ingredient3
      t.text :preparation

      t.timestamps null: false
    end
  end
end
