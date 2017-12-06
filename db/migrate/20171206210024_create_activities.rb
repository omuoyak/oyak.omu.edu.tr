class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :body
      t.string :cover
      t.date :date
      t.string :place

      t.timestamps
    end
  end
end
