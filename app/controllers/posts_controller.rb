class PostsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @todos = Post.all
    json_response(@todos)
  end

  # POST /posts
  def create
    @todo = Post.create!(post_params)
    json_response(@todo, :created)
  end

  # GET /posts/:id
  def show
    json_response(@todo)
  end

  # PUT /posts/:id
  def update
    @todo.update(post_params)
    head :no_content
  end

  # DELETE /posts/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def post_params
    # whitelist params
    params.permit(:title, :text, :category_id, :user_id)
  end

  def set_todo
    @todo = Post.find(params[:id])
  end
end