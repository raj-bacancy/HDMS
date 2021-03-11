class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.string :user_id
      t.string :subject
      t.text :reason
      t.string :status,default:'Pending'
      t.date :date_from
      t.date :date_to
      t.timestamps
    end
  end
end
