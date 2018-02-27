class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
