class ResourceTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :resources
end
