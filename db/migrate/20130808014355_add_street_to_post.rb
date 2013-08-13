class AddStreetToPost < ActiveRecord::Migration
  def change
    add_column :posts, :street, :string
  end
end
