class AddGroupToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :group_id, :int
  end
end
