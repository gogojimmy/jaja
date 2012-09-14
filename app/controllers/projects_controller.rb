#encoding: utf-8
class ProjectsController < ApplicationController
  before_filter :authenticate_user, :except => [:show, :index]

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:notice] = "#{@project.name} 建立成功"
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "#{@project.name} 更新成功"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    name = @project.name
    @project.destroy

    flash[:notice] = "#{name} 刪除成功"
    redirect_to projects_path
  end

end
