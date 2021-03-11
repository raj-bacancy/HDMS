class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.integer :capacity
      t.integer :vacancy
      t.timestamps
    end
  end
end
