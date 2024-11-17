class User < ApplicationRecord
  has_secure_password
  before_save :assign_default_role

  def assign_default_role
    self.role ||= "user"
  end
end
