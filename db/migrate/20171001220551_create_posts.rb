class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :cover
      t.string :title
      t.text :body
      t.string :keywords
      t.string :sef_link

      t.timestamps
    end
  end
end
