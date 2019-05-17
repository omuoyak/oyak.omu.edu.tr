class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :keywords
      t.string :sef_link

      t.timestamps
    end
  end
end
