class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user
  has_many :uploads
  has_attached_file :photo, { :styles => { :medium => "500x500#", :thumbnail => "225x168#"}}
  has_attached_file :photo2, { :styles => { :small => "50x50#"} }

  paginates_per 2

  searchable do
    text :title, :description
  end

  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at, :photo, :photo2, :photo3, :photo4, :photo5
  validates :title, :description, :user_id, :category, :presence => true
  validates :user_id, :numericality => {:greater_than_or_equal_to => 1}
  

end

