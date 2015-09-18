class ResourceTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :resource

  validates :resource, :topic, presence: true
  
end
