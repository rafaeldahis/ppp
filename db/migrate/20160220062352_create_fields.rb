class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
