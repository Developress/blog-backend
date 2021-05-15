class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    if params[:title].present?
      @posts = Post.search_by_starts_with(params[:title])
    else
      @posts = Post.all.with_categories.with_users
    end
    json_response(@posts.collect{|p| p.append_category_and_user})
  end

  # POST /posts
  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  # GET /posts/:id
  def show
    json_response(@post)
  end

  # PUT /posts/:id
  def update
    @post.update(post_params)
    json_response(@post)
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    json_response({"message": "deleted"})
  end

  # POST /posts/filter
  def filter
    categories_ids = params[:categories_ids]
    @posts = Array.new
    categories_ids.each do |id|
      @category = Category.find_by(id: id)
      @posts.push(*@category.posts)
    end
    json_response(@posts)
  end

  private

  def post_params
    # whitelist params
    params.permit(:title, :text, :category_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end