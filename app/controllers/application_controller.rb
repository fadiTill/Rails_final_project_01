class ApplicationController < ActionController::Base

    helper_method :current_user

def logged_in?
  !!current_user
end

# def current_user
#   @current_user ||= User.find_by(id: session[:user_id])
# end

private
def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end


end

