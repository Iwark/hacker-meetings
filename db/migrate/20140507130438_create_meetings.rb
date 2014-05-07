class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.integer :capacity
      t.integer :user_id, null:false
      t.string :image
      t.datetime :start_date, null:false
      t.datetime :end_date, null:false
      t.string :url
      t.string :place, null:false
      t.string :place_info

      t.index :user_id

      t.timestamps
    end
  end
end
