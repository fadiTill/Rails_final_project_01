class UsersController < ApplicationController



    def new
        @user = User.new
    end 


     def create
        # user = User.find_by(:email => params[:email])
        # if user && user.authenticate(params[:password])
        @user = User.new(user_params)
        if @user.save
         session[:user_id] = @user.id
        
         redirect_to user_path(@user), :alert=> "Welcome to Open house app! You Signed up / Bienvenue"
        else 
            render 'new', :alert=> "Please fill in the form"
      end 
    end



def edit
    @user = User.find_by(id: params[:id])
end


    def show 
        return redirect_to root_path unless logged_in?
        @user = User.find_by(id: params[:id])
    end 


    private 

   
    def user_params
        params.require(:user).permit(:name, :email, :password)
     end 
  end