class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all.with_categories.with_users
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

  private

  def post_params
    # whitelist params
    params.permit(:title, :text, :category_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end