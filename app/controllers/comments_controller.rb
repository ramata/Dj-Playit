class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]

# GET /comments
def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
      @user = current_user
      @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @user = current_user
    @comment = Comment.new
end

# Comment /comments
  def create
    @user = current_user
    # @user = User.find(params[:user_id])
    @comment = @user.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

  def edit
    @user = current_user
    @comment = Comment.find(params[:id])
  end

# PATCH/PUT /posts/1
  def update
    @user = current_user
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /posts/1
  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:user_id])

    @comment.destroy
  respond_to do |format|
    format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author)
    end
  end
