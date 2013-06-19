class AddUserRepToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_rep, :integer
  end
end
