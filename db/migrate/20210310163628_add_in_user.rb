class AddInUser < ActiveRecord::Migration[6.1]
  def change
  	add_column :users,'room_no','string'
  	add_column :users,'role','string'
  end
end
