class Resource < ActiveRecord::Base
  belongs_to :user

  has_many :resource_topics
  has_many :topics, :through => :resource_topics

  # validations

end
