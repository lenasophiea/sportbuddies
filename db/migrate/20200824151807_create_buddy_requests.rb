class CreateBuddyRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :buddy_requests do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :sport, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
