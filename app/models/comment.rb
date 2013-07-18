class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :post
  belongs_to :user
  
  attr_accessible :post_id, :text, :user_id, :user_name


end
