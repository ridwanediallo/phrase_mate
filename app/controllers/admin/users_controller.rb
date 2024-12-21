class Admin::UsersController < ApplicationController
  before_action :authorize_request
  before_action :require_admin

  # POST /admin/users
  def create
    user = User.new(admin_user_params)
    if user.save
      render json: { user: user, message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def admin_user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def require_admin
    unless @current_user&.role == "admin"
      render json: { error: "Unauthorized. Admin access required." }, status: :forbidden
    end
  end
end
