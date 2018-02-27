class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.date :start_date
      t.date :end_date
      t.string :description

      t.timestamps
    end
  end
end
