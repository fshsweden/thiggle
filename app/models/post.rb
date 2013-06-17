class Post < ActiveRecord::Base
  belongs_to :user  
  has_one :user

  searchable do
    text :title, :description
  end

  attr_accessible :category, :description, :location, :price, :title, :user_id, :created_at
  validates :title, :description, :user_id, :category, :presence => true
  validates :user_id, :numericality => {:greater_than_or_equal_to => 1}

end

