class Api::V1::CommentsController < ApplicationController
  def index
    @article = Article.find_by_id(params[:article_id])
    render json: @article.comments, status: 200
  end

  def create
    @article                 = Article.find_by_id(params[:article_id])
    @article_comment         = @article.comments.create(comment_params)
    @article_comment.user_id = @current_api_v1_user.id
    @article_comment.save
    render json: @article.comments.last, status: 201
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    render json: @comment, status: 200
  end

  def destroy 
    @comment            = Comment.find_by_id(params[:id])
    @article_owner_id   = (Article.find_by_id(@comment.article_id)).user_id
    if @comment.user_id == @current_api_v1_user.id || @article_owner_id == @current_api_v1_user.id
      @comment.destroy
    else
      render json: error: "Can only delete own comment or comment on your own article", status: 401
    end
  end

  private

  def comment_params
    params.permit(:comment, :user_id, :article_id)
  end
end
