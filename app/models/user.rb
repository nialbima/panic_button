class User < ActiveRecord::Base
  belongs_to :cohort

  has_secure_password

  # validates :first_name, :password, :last_name, :email, :cohort_id, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
