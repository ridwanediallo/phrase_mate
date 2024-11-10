class ApplicationController < ActionController::API
  def authorize_request
    token = request.headers["Authorization"]&.split(" ")&.last
    begin
      decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: "HS256" })
      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::DecodeError
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end
end
