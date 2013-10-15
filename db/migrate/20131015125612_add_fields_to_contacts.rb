class AddFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :description, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :city, :string
    add_column :contacts, :birthday, :date
  end
end
