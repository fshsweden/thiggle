class RemoveUneccesaryColumns < ActiveRecord::Migration
  def up
    drop_attached_file :posts, :photo2
    drop_attached_file :posts, :photo3
    drop_attached_file :posts, :photo4
    drop_attached_file :posts, :photo5
    drop_attached_file :posts, :photo
  end

  def down
  end
end
