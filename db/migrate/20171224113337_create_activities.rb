class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :speaker
      t.datetime :date
      t.string :detail
      t.string :location
      t.string :poster
      t.string :sef_link
      t.integer :tbs_id

      t.timestamps
    end
  end
end
