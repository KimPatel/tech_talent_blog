class BlogPostsController < ApplicationController

  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  def index
  	@blog_posts = BlogPost.order("created_at desc")
  end

  def user_posts
    @user = User.find_by(username: params[:name])
  end

  def show
  	@comment = Comment.new
  end

  def edit
    no_access(current_user, @blog_post)
  end

  def new
  	@blog_post = BlogPost.new
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)

  	respond_to do |format|
  		if @blog_post.save
  			format.html { redirect_to blog_posts_url(@blog_post), notice: "Blog Post was created successfully"}
  		else
  			format.html { render :new}
  		end
  	end
  end

  def update
  	respond_to do |format|
  		if @blog_post.update(blog_post_params)
  			format.html { redirect_to blog_posts_url(@blog_post), notice: "Blog Post was successfully updated"}
  		else 
  			format.html { render :edit}
  		end
  	end
  end

  def destroy
  	@blog_post.destroy

  	respond_to do |format|
  		format.html { redirect_to blog_posts_url, notice: "Your Blog Post was DESTROOOOOYYYYYYYEED, son!!!!"}
  	end
  end

  private

  def blog_post_params
  	params.require(:blog_post).permit(:title, :blog_entry, :user_id)
  end

  def set_blog_post
  	@blog_post = BlogPost.find(params[:id])
  end

end
