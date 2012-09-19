#encoding: utf-8
require 'spec_helper'

describe ProjectsController do
  describe "Get index" do
    it "return published projects" do
      publish_project = FactoryGirl.create(:project, :is_publish => true)
      unpublish_project = FactoryGirl.create(:project)
      visit "/"
      page.should have_content(publish_project.name)
      page.should_not have_content(unpublish_project.name)
    end
  end
  describe "Get show" do
    it "return published project with description and name" do
      project = FactoryGirl.create(:project, :is_publish => true)
      visit "/projects/#{project.id}"
      page.should have_content(project.name)
      page.should have_content(project.description)
    end
    it "return 404 when visit unpublish project" do
      project = FactoryGirl.create(:project)
      visit "/projects/#{project.id}"
      page.should have_content("您要找的頁面並不存在")
    end
  end
end
