class RemoveDateFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :date
  end

  def down
  end
end
