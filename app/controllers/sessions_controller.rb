require 'pry'

class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create

  # def create
  #   pp request.env['omniauth.auth']
  #   session[:name] = request.env['omniauth.auth']['info']['name']
  #   session[:omniauth_data] = request.env['omniauth.auth']

   
  #   redirect_to root_path
  # end

#   def new
#   end

#   def create
#     @user = User.find_by(name: params[:user][:name])
#     session[:user_id] = @user.id
#     redirect_to user_path(@user)
#   end

#   def destroy
#     session.destroy
#     redirect_to root_path
#   end

# end 

  def new 

  end


  def create 
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    # redirect user_path
    redirect_to user_path(@user)
  end

def delete
  session.destroy
  redirect_to root_path
  end 

end
   
  