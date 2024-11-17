class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    token = request.headers["Authorization"]&.split(" ")&.last
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: "HS256" })
      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::DecodeError
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end

  def admin_only
    unless @current_user&.role == "admin"
      render json: { error: "Access denied" }, status: :forbidden
    end
  end
end
