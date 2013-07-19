class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.user_name = current_user.username
    flash[:notice] = "Post successfully created"
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url, :flash => { :success => "Message" }}
        #format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render controller: "posts", action: "index" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
