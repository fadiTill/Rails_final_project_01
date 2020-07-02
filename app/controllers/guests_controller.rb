class GuestsController < ApplicationController
   
    def index
     if logged_in?
     @guests = current_user.guests
     end
   
   
    def new
     @guest = Guest.new
    end 


    def create
         @guest = current_user.guests.build(params)
        # @guest = Guest.create(guest_params)
        @guest.save
        redirect_to guest_path(@guest)
        
    end 
end



    def show 
        # @guest = current_user.guests.build(params)
        @guest = Guest.find_by(id: params[:id])
    end 


    def edit
        @guest = Guest.find_by(id: params[:id])
    end

def update
    @guest = Guest.find_by(id: params[:id])
    @guest.update(guest_params)
    redirect_to guest_path(@guest)
end

    def delete
        if current_user.id == @guest.user_id
        @guest.delete
        render 'index'
    end

    private 


    # t.string "name"
    # t.string "phone_number"
    # t.string "adress"
    # t.string "email"
    # t.string "time_line"
    # t.text "comment"
    
    def guest_params
        params.require(:guest).permit(:name, :phone_number, :adress, :email, :time_line, :comment)
    end 
end
end