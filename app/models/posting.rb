class Posting < ActiveRecord::Base
  attr_accessible :category, :description, :location, :postdate, :postid, :price, :title, :userid

  validates_prescence_of :category, :description, :location, :postdate, :postid, :price, :title, :userid
  validates_uniqueness_of :postid, :allow_blank => false, :userid

  searchable :autoindex => true, auto_remove true do
    text :title, :boost =>
    text :description
  end

  def to_s
    self.name
  end

end

