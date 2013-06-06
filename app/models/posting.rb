class Posting < ActiveRecord::Base
  attr_accessible :category, :description, :location, :postdate, :postid, :price, :title, :userid

  
  searchable do
   text :title, :description
  end

  def to_s
    self.name
  end

end

