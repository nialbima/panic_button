class User < ActiveRecord::Base
  belongs_to :cohort

  has_secure_password

  validates :password, :email, presence: true


  def name
    "#{first_name} #{last_name}"
  end
end
