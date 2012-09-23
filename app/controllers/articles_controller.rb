#encoding: utf-8
class ArticlesController < ApplicationController
  def index
    if params[:tag]
      @tag = params[:tag]
      @articles = Article.tagged_with(@tag)
    else
      redirect_to projects_path
    end
  end
  def show
    @project = Project.published.find(params[:project_id])
    @article = @project.articles.find(params[:id])
    @page_title = @article.title
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "您要找的頁面並不存在"
    redirect_to "/"
  end
end
