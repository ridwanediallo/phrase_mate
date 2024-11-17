class User < ApplicationRecord
  has_secure_password
  before_save :assign_default_role
  ROLES = %w[user admin]
  validates :role, inclusion: { in: ROLES }

  def assign_default_role
    self.role ||= "user"
  end
end
