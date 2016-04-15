module Authenticable
  def user_valid?
    User.where(email: request.headers['X-User-Email'], api_token: request.headers['X-Api-Token']).present?
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                   status: :unauthorized unless user_valid?
  end
end