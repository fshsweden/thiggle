class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user
  has_many :comments, :dependent => :destroy
  has_attached_file :photo, { 
    :styles => { 
      :medium => "1024x768", 
      :thumb => "160x160#"
      },
    :convert_options => {
      :thumb => "-quality 75 -strip -gravity center"
    }
    }
  has_attached_file :photo2, { :styles => { :medium => "1024x768", :thumb => "160x160#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo3, { :styles => { :medium => "1024x768", :thumb => "160x160#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo4, { :styles => { :medium => "1024x768", :thumb => "160x160#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  has_attached_file :photo5, { :styles => { :medium => "1024x768", :thumb => "160x160#"}, :convert_options => {
      :thumb => "-quality 75 -strip" } }
  acts_as_taggable
  paginates_per 2
  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at, :photo, :photo2, :photo3, :photo4, :photo5, :tag_list, :post_id, :posts, :street

  searchable do
    text :title, :description
    string :category
    time :created_at
    integer :price
    string :location
  end

  
  validates :title, :description, :category, :photo, :presence => true
  #validates :user_id, :numericality => {:greater_than_or_equal_to => 1}
  validates_length_of :description, :minimum => 5, :maximum => 2200
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_size :photo2, :less_than => 5.megabytes
  validates_attachment_size :photo3, :less_than => 5.megabytes
  validates_attachment_size :photo4, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => /image/
  validates_attachment_content_type :photo2, :content_type => /image/ 
  validates_attachment_content_type :photo3, :content_type => /image/ 
  validates_attachment_content_type :photo4, :content_type => /image/  
  

end

