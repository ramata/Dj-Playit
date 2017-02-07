class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

# GET /comments
def index
    @comments = Comment.all
  end

  # GET /comments/new
  def new
    @user = current_user
    @comment = @user.comments.create(params[:id])
    @comment = Comment.new
end

# Comment /comments
  def create
    @user = current_user
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(comment_params)
    @comment.user_id = current_user.id

    redirect_to comment_path(@comment)
end

# GET /comments/1
def show
    @user = current_user
    @comment =@user.comments.find(params[:id])
  end


  def edit
    @user = current_user
    @comment = Comment.find(params[:id])
  end

# PATCH/PUT /posts/1
  def update
    @user = current_user
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render 'edit'
    end
  end

# DELETE /comments/1
  def destroy
    @user = current_user
    @comment = @user.comments.find(params[:id])

    @comment.destroy
    redirect_to comments_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author, :user_id)
    end
  end
