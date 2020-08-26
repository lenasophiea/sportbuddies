class RemoveEndDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :buddy_requests, :end_time, :datetime
    rename_column :buddy_requests, :start_time, :date
  end
end
