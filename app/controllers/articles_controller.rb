#encoding: utf-8
class ArticlesController < ApplicationController
  def show
    @project = Project.published.find(params[:project_id])
    @article = @project.articles.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "您要找的頁面並不存在"
    redirect_to "/"
  end
end
