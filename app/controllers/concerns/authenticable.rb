module Authenticable
  def user_valid?
    email = request.headers['X-User-Email']
    api_token = request.headers['X-Api-Token']

    @current_user ||= User.find_by(email: email)

    (@current_user && @current_user.api_token == api_token) ? true : false
  end

  def authenticate_with_token!
    head 401 unless user_valid?
  end
end