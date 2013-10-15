class RemoveBirthday < ActiveRecord::Migration
  #because it has no sence for ponies!
  def change
    remove_column :contacts, :birthday
  end
end
