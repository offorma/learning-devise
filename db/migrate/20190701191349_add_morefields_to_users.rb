class AddMorefieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :number
    add_column :users, :relationship, :string
  end
end
