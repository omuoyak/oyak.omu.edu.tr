class AddSomeFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :picture, :string
    add_column :users, :role, :string
  end
end
