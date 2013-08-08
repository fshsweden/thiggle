class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user
  has_many :comments, :dependent => :destroy
  has_attached_file :photo, { 
    :styles => { 
      :medium => "400x400^", 
      :thumb => "150x125#"
      },
    :convert_options => {
      :thumb => "-quality 75 -strip -gravity center"
    }
    }
  has_attached_file :photo2, { :styles => { :thumb => "150x125#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo3, { :styles => { :thumb => "150x125#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo4, { :styles => { :thumb => "150x125#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo5, { :styles => { :thumb => "150x125#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  acts_as_taggable
  paginates_per 2
  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at, :photo, :photo2, :photo3, :photo4, :photo5, :tag_list, :post_id, :posts

  searchable do
    text :title, :description
    string :category
    time :created_at
    integer :price
  end

  
  validates :title, :description, :category, :photo, :presence => true
  #validates :user_id, :numericality => {:greater_than_or_equal_to => 1}
  validates_length_of :description, :minimum => 5, :maximum => 200
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_size :photo2, :less_than => 5.megabytes
  validates_attachment_size :photo3, :less_than => 5.megabytes
  validates_attachment_size :photo4, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => /image/
  validates_attachment_content_type :photo2, :content_type => /image/ 
  validates_attachment_content_type :photo3, :content_type => /image/ 
  validates_attachment_content_type :photo4, :content_type => /image/  
  

end

