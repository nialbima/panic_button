class Topic < ActiveRecord::Base
  has_many :resource_topics
  has_many :resources, :through => :resource_topics


  validates :name, :docs_url, :description, presence: true

end
