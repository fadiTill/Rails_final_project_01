class UsersController < ApplicationController


    def new
        @user = User.new
    end 


    def create
        @user = User.new(user_params)
        if @user.save
         session[:user_id] = @user.id
         redirect user_path(@user), :alert=> "Welcome to Open house app! You Signed up / Bienvenue"
        else 
            render 'new', :alert=> "Please fill in the form"

    end 



    def show 
        return redirect_to root_path unless logged_in?
        @user = User.find_by(:id params [:id])
    end 


    private 

    # t.string "name"
    # t.string "email"
    # t.string "uid"
    # t.string "image"

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end 