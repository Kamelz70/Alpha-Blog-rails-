class ArticlesController < ApplicationController
  #applies middleware before the actions specified in only
  before_action :set_article, only: [:show,:edit,:update,:destroy]
  def show
  end
  
  def index
    # byebug
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(get_article_data)
    if @article.save
      flash[:notice] = 'Article created!' # or :alert
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Article was not created!' # or :alert
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(get_article_data)
      flash[:notice] = 'Article edited!' # or :alert
      redirect_to @article
    else
      flash[:notice] = 'Article was not created!' # or :alert
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  #makes definitions after private
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def get_article_data
    params.require(:article).permit(:title, :description)
  end
end