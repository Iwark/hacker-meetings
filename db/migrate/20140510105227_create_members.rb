class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :meeting_id, null:false
      t.integer :user_id, null:false
      t.datetime :joined_at, null:false
      t.string :status, null:false

      t.index :user_id
      t.index :meeting_id
      t.index [:user_id, :meeting_id]

      t.timestamps
    end
  end
end
