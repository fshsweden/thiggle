class Upload < ActiveRecord::Base
  attr_accessible :upload, :post_id
  belongs_to :post

  end

end