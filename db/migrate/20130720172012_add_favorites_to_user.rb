class AddFavoritesToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_posts, :string
    add_column :posts, :completed, :boolean
  end
end
