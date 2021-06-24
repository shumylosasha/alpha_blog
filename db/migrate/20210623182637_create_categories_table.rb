class CreateCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string "name"
      t.timestamps
    end
    drop_table :category_tables
  end
end
