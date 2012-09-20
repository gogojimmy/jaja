class Project < ActiveRecord::Base
  attr_accessible :name, :user_id, :description, :is_publish
  has_many :articles
  belongs_to :user

  scope :published, where(:is_publish => true)

  def title_with_id
    array = []
    html = Markdown.parse(self.description)
    doc = Nokogiri::HTML(html)
    doc.xpath('//h2').each do |node|
      array << { node['id'] => node.text }
    end
    array
  end
end
