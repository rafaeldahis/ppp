class AddTrackerToField < ActiveRecord::Migration
  def change
    add_reference :fields, :tracker, index: true, foreign_key: true
  end
end
