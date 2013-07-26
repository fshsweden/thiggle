class FavoritePostsController < ApplicationController
  
  def create
    current_user.favorites.create(:post_id => params[:post_id])
    render :layout => false
  end

end
