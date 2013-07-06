class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user
  has_attached_file :photo, {
            :styles => { :large => "700x400#", :medium=>"500x500#", :thumbnail=>"225x168#" }}
  
  paginates_per 2

  searchable do
    text :title, :description
  end

  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at, :photo
  validates :title, :description, :user_id, :category, :presence => true
  validates :user_id, :numericality => {:greater_than_or_equal_to => 1}
  validates_attachment_content_type :photo, :content_type => /image/

end

