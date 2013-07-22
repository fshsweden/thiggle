class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user
  has_many :comments, :dependent => :destroy
  has_many :favorites, :through => :favorite_posts, :class_name => "User"
  has_attached_file :photo, { 
    :styles => { 
      :medium => "400x400^", 
      :thumbnail => "225x168#"
      },
    :convert_options => {
      :thumb => "-quality 75 -strip -gravity center"
    }
    }
  has_attached_file :photo2, { :styles => { :small => "50x50#"} }
  has_attached_file :photo3, { :styles => { :small => "50x50#"} }
  has_attached_file :photo4, { :styles => { :small => "50x50#"} }
  has_attached_file :photo5, { :styles => { :small => "50x50#"} }
  acts_as_taggable
  paginates_per 2


  searchable do
    text :title, :description
  end

  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at, :photo, :photo2, :photo3, :photo4, :photo5, :tag_list
  validates :title, :description, :user_id, :category, :photo, :presence => true
  validates :user_id, :numericality => {:greater_than_or_equal_to => 1}
  validates_length_of :description, :minimum => 5, :maximum => 160
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_size :photo2, :less_than => 5.megabytes
  validates_attachment_size :photo3, :less_than => 5.megabytes
  validates_attachment_size :photo4, :less_than => 5.megabytes
  

end

