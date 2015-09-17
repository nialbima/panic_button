class Comment < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user

  validates :content, :resource_id, :user_id, :id, presence: true
  
end
