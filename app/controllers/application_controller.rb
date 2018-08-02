class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def basic_auth
    user = User.find_by_email(request.headers['X-User-Email'])
    if user
      if user.api_token == request.headers['X-Api-Token']
        sign_in user
      end
    end
  end

end
