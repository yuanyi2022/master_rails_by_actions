class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :integer
  end
end
