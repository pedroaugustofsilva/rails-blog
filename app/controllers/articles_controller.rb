# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update edit destroy]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to article_url(@article), notice: I18n.t(:successfully_created, name: Article.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: I18n.t(:successfully_updated, name: Article.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_url, notice: I18n.t(:successfully_destroyed, name: Article.model_name.human)
  end

  private

  def set_article
    @article = params[:slug] ? Article.find_by(slug: params[:slug]) : Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end
end
