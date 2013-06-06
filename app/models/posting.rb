class Posting < ActiveRecord::Base
  attr_accessible :category, :description, :location, :date, :post_id, :price, :title, :user_id
  validates :title, :description, :post_id, :user_id, :category, :date, :presence => true
  validates :user_id, :post_id, :numericality => {:greater_than_or_equal_to => 1}
  validates :post_id, :uniqueness => true


end

