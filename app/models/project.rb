class Project < ActiveRecord::Base
  attr_accessible :name, :user_id, :description, :is_publish
  belongs_to :user

  scope :published, where(:is_publish => true)
end
