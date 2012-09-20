#encoding: utf-8
require 'spec_helper'

describe ArticlesController do
  describe "Get show" do
    it "should return article" do
      project = FactoryGirl.create(:project, is_publish: true)
      article = FactoryGirl.create(:article, project: project, is_publish: true)
      visit "/projects/#{article.project.id}/articles/#{article.id}"
      page.should have_content(article.content)
    end
  end
end
