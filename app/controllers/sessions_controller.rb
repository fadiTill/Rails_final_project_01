require 'pry'

class SessionsController < ApplicationController
  #  skip_before_action :verify_authenticity_token, only: :create

  # def create
  #   pp request.env['omniauth.auth']
  #   session[:name] = request.env['omniauth.auth']['info']['name']
  #   user = User.sign_in_from_aumniauth(auth)
  #   session[:user_id] = @user.id
  #   session[:omniauth_data] = request.env['omniauth.auth']

   
  #   redirect_to root_url, notice: "SIGNED IN"
  # end



  def new 

  end


  def create 
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  

    def destroy
      session.destroy
      redirect_to root_path
      end 
    end
   
  