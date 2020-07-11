class WelcomeController < ApplicationController
   
def home
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   end
   end


   def set_auth
    @auth = session[:omniauth] if session [aumniauth]
end
end