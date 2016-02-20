class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :task
      t.text :status

      t.timestamps null: false
    end
  end
end
