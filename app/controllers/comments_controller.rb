class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]
  # before_filter :authenticate_user!, except: [:index]

# GET /comments
  def index
    @user = current_user
    @comments = Comment.all
  end

  # GET /comments/new
  def new
    @user = current_user
    @comment = @user.comments.new
end

# Comment /comments
  def create
  @user = current_user
    @comment = @user.comments.create(comment_params)

    redirect_to user_comment_path(@user, @comment)
end

# GET /comments/1
  def show
    @user = current_user
    @comment = @user.comments.find(params[:id])

  end


  def edit
    @user = current_user
    @comment = @user.comments.find(params[:id])
  end

# PATCH/PUT /posts/1
  def update
    @user = current_user
    @comment = @user.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to user_comment_path(@user)
    else
      render 'edit'
    end
  end

# DELETE /comments/1
  def destroy
    @user = current_user
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_comments_path(@user)
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
