class AddUserToTracker < ActiveRecord::Migration
  def change
    add_reference :trackers, :user, index: true, foreign_key: true
  end
end
