class CreatePostings < ActiveRecord::Migration
  def self.up
    create_table :postings do |t|
      t.integer :postid, :null => false
      t.string :title
      t.text :description
      t.text :category
      t.text :location
      t.datetime :postdate
      t.integer :price
      t.integer :userid

      t.timestamps
    end
  
  def self.down
    drop_table :postings
  end

end
