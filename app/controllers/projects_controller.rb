#encoding: utf-8
class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def show
    @project = Project.publisehd.find(params[:id])
    redirect_to projects_path unless @project
  end
end
