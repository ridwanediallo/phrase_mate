class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    token = request.headers["Authorization"]&.split(" ")&.last
    if token.nil?
      render json: { error: "No token provided" }, status: :unauthorized
      return
    end

    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { 
        algorithm: "HS256",
        exp_leeway: 30 # 30 seconds leeway for clock skew
      })
      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::ExpiredSignature
      render json: { 
        error: "Token has expired", 
        code: "token_expired"
      }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { 
        error: "Invalid token", 
        code: "token_invalid"
      }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound
      render json: { 
        error: "User not found", 
        code: "user_not_found"
      }, status: :unauthorized
    end
  end

  def admin_only
    unless @current_user&.admin?
      render json: { error: "Access denied" }, status: :forbidden
    end
  end
end
