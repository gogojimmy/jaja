class Article < ActiveRecord::Base
  attr_accessible :user_id, :project_id, :content, :title, :is_publish, :description

  belongs_to :user
  belongs_to :project

  scope :published, where(is_publish: true)
  scope :un_published, where(is_publish: false)

  def title_with_id
    array = []
    html = Markdown.parse(self.content)
    doc = Nokogiri::HTML(html)
    doc.xpath('//h2').each do |node|
      array << { node['id'] => node.text }
    end
    array
  end
end
