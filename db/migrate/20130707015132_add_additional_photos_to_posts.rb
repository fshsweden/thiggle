class AddAdditionalPhotosToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
      t.attachment :photo5
    end
  end

  def self.down
    drop_attached_file :posts, :photo2
    drop_attached_file :posts, :photo3
    drop_attached_file :posts, :photo4
    drop_attached_file :posts, :photo5
  end
end
