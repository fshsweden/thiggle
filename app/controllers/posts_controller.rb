class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  
  def index
    #@posts2 = Post.order('created_at DESC').page params[:page]
    query_string = params[:q]
    category = params[:cat]
    
    @search = Post.search do
      keywords(query_string)
      with(:category, params[:cat]) if params[:cat].present?
    end
    @posts = @search.results
    #@post = Post.order(:create_at).page params[:page]

    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
    
  end
  
  
  
    
    
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @post_user = User.find(@post.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
  #  @post.date = Time.now
    if user_signed_in? 
      @post.user_id = current_user.id
    else 
      @post.user_id = 0
    end
    
    User.find(@post.user_id).update_attributes(:rep => (current_user.rep + 10))



    respond_to do |format|
      if @post.save
        format.html { redirect_to @post}
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    
    query_string = params[:q]    

    @search = Post.search do
      keywords(query_string)
    end

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end