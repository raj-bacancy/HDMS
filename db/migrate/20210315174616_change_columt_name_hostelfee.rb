class ChangeColumtNameHostelfee < ActiveRecord::Migration[6.1]
  def change
  	remove_column :hostelfees, :stutas, :string
  	add_column :hostelfees,:status,:boolean,default:false
  end
end
