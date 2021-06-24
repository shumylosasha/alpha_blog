class CreateCategoryTable < ActiveRecord::Migration[6.1]
  def change
    create_table :category_tables do |t|
      t.string "name"
      t.timestamps
    end
  end
end
