class Topic < ActiveRecord::Base
  has_many :resources, through: :resource_topics
  has_many :resource_topics
end
