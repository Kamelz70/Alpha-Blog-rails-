class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    # byebug
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article created!' # or :alert
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Article was not created!' # or :alert
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article created!' # or :alert
      redirect_to @article
    else
      flash[:notice] = 'Article was not created!' # or :alert
      render "edit"
    end
  end
end