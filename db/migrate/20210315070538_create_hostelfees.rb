class CreateHostelfees < ActiveRecord::Migration[6.1]
  def change
    create_table :hostelfees do |t|
      t.string :stutas
      t.string :year
      t.string :user_id
      t.timestamps
    end
  end
end
