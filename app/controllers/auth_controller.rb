class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [ :register, :login ]
  # POST /register
  def register
    user = User.new(user_params)
    if user.save
      render json: { user: user, message: "User registered successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, "HS256")
  end
end
