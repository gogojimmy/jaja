class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_projects

  protected

  def find_projects
    @all_projects = Project.published
  end
end
