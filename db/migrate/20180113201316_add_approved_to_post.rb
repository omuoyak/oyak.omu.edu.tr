class AddApprovedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :approved, :boolean, default: false
  end
end
