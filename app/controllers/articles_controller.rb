# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update edit destroy]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = if category_name.present?
                  Article.joins(:category).where(category: { name: category_name }).all.order(created_at: :desc)
                else
                  Article.all.order(created_at: :desc)
                end
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to article_url(@article), notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :slug, :content, :category_id)
  end

  def category_name
    params[:category]
  end
end
