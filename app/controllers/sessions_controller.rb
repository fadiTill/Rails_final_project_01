require 'pry'

class SessionsController < ApplicationController
  

  def new 
  end


  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to signin_path
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end
  end
  

  def destroy
      reset_session
      redirect_to root_path
      end 
    end


#   def create 
#     @user = User.find_by(email: params[:email])
#    if @user && @user.authenticate(params[:password])
#     session[:user_id] = @user.id
#      redirect_to user_path(@user)
#    else 
#       render 'new'
    
#   end
# end

  

    # def destroy
    #   session.destroy
    #   redirect_to root_path
    #   end 
    # end


# def create
#   @user = User.find_or_create_from_auth_hash(auth_hash)
#   self.current_user = @user
#   redirect_to '/'
# end

# protected

# def auth_hash
#   request.env['omniauth.auth']
# end
# end
   
  