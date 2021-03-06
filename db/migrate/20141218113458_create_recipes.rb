class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :preparation
      t.text :category
      t.integer :user_id

      t.timestamps
    end
  end
end
