class AddStatusUser < ActiveRecord::Migration[6.1]
  def change
  	add_column :users,'status','boolean',default: :false
  end
end
