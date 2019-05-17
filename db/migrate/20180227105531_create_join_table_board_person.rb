class CreateJoinTableBoardPerson < ActiveRecord::Migration[5.2]
  def change
    create_join_table :boards, :people do |t|
      # t.index [:board_id, :person_id]
      # t.index [:person_id, :board_id]
    end
  end
end
