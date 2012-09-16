#encoding: utf-8
class ProjectsController < ApplicationController

  def index
    @projects = Project.published.paginate(:page => params[:page])
  end

  def show
    @project = Project.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "您要找的頁面並不存在"
    redirect_to "/"
  end
end
