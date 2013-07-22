class CreateTableFavoritePosts < ActiveRecord::Migration
  def change
    create_table :favorite_posts do |t|
      t.integer :post_id
      t.integer :user_id
    end
    
    remove_column :users, :favorite_posts
  end

end
