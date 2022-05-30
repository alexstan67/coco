class AddFieldsUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :address, :text, null: false
    add_column :users, :profile, :binary
  end
end
