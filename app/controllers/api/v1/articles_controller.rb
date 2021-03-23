class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy]
  def index
    @ransack  = Article.ransack(params[:q])
    @articles = @ransack.result.order(created_at: :desc)

    render json: @articles, status: 200
  end

  def show
    render @article
  end

  def create
    @article         = current_api_v1_user.articles.build(article_params)
    @article.user_id = current_api_v1_user.user_id

    if @article.save
      render json: @article, status: :create
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.user_id == @current_api_v1_user.id
      @article.destroy
    else
      render json: error: "Can only delete own article", status: 401
    end
  end

  private

  def article_params
    params.permit(:title, :description, :user_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
