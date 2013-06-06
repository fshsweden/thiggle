class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :title
      t.string :category
      t.text :description
      t.string :location
      t.integer :price
      t.datetime :date

      t.timestamps
    end
  end
end
