class DropTableLists < ActiveRecord::Migration
  def change
  	drop_table :lists
  end
end
