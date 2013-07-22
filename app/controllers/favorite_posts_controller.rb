class FavoritePostsController < ApplicationController
  def create
    @favorite_post = Favorite_Posts.new
    
  end

end
