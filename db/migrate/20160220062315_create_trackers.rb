class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.text :period

      t.timestamps null: false
    end
  end
end
