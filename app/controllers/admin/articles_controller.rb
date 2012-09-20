#encoding: utf-8
class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @article = @project.articles.build
  end

  def create
    @project = Project.find(params[:project_id])
    @article = @project.articles.build(params[:article])
    @article.user = current_user
    if @article.save
      flash[:notice] = "成功新增文章"
      redirect_to admin_article_path @article
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @article = @project.articles.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @article = @project.articles.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:notice] = "成功更新文章"
      redirect_to admin_article_path(@article)
    else
      render :edit
    end
  end

  def destroy
  end
end
