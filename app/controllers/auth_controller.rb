class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [ :register, :login ]
  
  # POST /register
  def register
    user = User.new(user_params)
    user.role = "user"  # Force role to be "user" for all new registrations
    if user.save
      token = encode_token({ user_id: user.id })
      render json: { 
        user: user, 
        token: token,
        expires_at: Time.now + 24.hours,
        message: "User registered successfully" 
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { 
        user: user, 
        token: token,
        expires_at: Time.now + 24.hours
      }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def encode_token(payload)
    expiration = Time.now.to_i + 24 * 3600  # 24 hours from now
    payload = payload.merge({ exp: expiration })
    JWT.encode(payload, Rails.application.credentials.secret_key_base, "HS256")
  end
end
