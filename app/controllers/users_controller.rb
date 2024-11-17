class UsersController < ApplicationController
  before_action :authorize_request
  before_action :admin_only, except: [ :show, :update, :destroy ]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.present?
      render json: { error: "User already exists" }, status: :conflict
      return
    end
    if user.save
      render json: { message: "User created successfully", user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

 def update
    user = User.find(params[:id])
    if @current_user == user || @current_user.role == "admin"
      if user.update(user_params)
        render json: user, status: :ok
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Forbidden" }, status: :forbidden
    end
 end

  def destroy
    user = User.find(params[:id])
    if user.nil?
      render json: { error: "User not found" }, status: :not_found
      return
    end

    if @current_user == user || @current_user.role == "admin"
      user.destroy
      render json: { message: "User deleted successfully" }, status: :ok
    else
      render json: { error: "Forbidden" }, status: :forbidden
    end
  end

  private

  def user_params
    params.permit(:email, :password, :role)
  end
end
