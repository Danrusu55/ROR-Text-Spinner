class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:edit, :update, :show, :destroy, :gen]

  def index
    @articles = current_user.articles.all
  end
  # Creates article
  def new
    @article = Article.new
  end
  # Saves article
  def create
    @article = Article.new(article_params)
    if @article.save(article_params)
      flash[:notice] = "Successfully created #{@article.title}"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Error creating #{@article.title}"
      render :newstac
    end
  end
  # renders edit page
  def edit

  end
  #updates article with new info
  def update
    if @article.update_attributes(article_params)
      flash[:notice] = "Successfully updated article!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Error updating article!"
      render :edit
    end
  end

  # renders the article
  def show
  end

  # deletes the article
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to articles_path
    else
      flash[:alert] = "Error deleting article"
    end
  end

  # MY OWN METHODS

  def gen
    @article = Article.find(params[:id])
    titlesList = @article.title.split('||')
    bodiesList = @article.body.split('||')
    keywordsList = @article.keywords.split('||')
    @articleList = []
    1.times do
      finalArticle = {'title' => titlesList.sample, 'body' => bodiesList.sample, 'keywords' => keywordsList.sample(15).join(', ')}
      @articleList.push(finalArticle)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:body,:keywords,:name)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
