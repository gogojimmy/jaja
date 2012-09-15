class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_projects
  before_filter :authenticate

  protected

  def find_projects
    @all_projects = Project.published
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
       username == "jimmy" && password == "0975519929"
     end
  end

end
