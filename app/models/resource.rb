class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :topics, through: :resource_topics
  has_many :resource_topics
end
