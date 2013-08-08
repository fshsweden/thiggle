class AddStreetToPost < ActiveRecord::Migration
  def change
    add_column :posts, :street, :string
    drop_table :admins
    drop_table :uploads
    drop_table :favorites
    drop_table :favorite_posts
  end
end
