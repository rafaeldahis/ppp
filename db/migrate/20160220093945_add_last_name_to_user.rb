class AddLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :text
  end
end
