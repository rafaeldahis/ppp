class AddFieldToEntry < ActiveRecord::Migration
  def change
    add_reference :entries, :field, index: true, foreign_key: true
  end
end
