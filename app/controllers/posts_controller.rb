class PostsController < ApplicationController

  def index
   logger.info"################ #{params.inspect}"
   @posts = Post.all

   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end


  def show
   logger.info"################ #{params.inspect}"
   @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    logger.info"################ #{params.inspect}"
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end


  def edit
    logger.info"################ #{params.inspect}"
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    logger.info"################ #{params.inspect}"
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
    logger.info"################ #{params.inspect}"
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(:title => params[:post][:title], :content => params[:post][:content])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
    logger.info"################ #{params.inspect}"
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
