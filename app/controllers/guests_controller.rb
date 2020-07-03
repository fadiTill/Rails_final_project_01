class GuestsController < ApplicationController
   



    def new
        @guest = Guest.new
    end
   
     def create
    #    @guest = current_user.guests.build(params)
    #    if guest.save
        @guest = User.create(guest_params)
        # message = guest.call_guest
        redirect_to user_path(current_user)
        
    end 


    private 


    # t.string "name"
    # t.string "phone_number"
    # t.string "adress"
    # t.string "email"
    # t.string "time_line"
    # t.text "comment"
    # t.integer :user_id
    # t.integer :house_id
    
    def guest_params
        params.require(:guest).permit(:name, :phone_number, :adress, :email, :time_line, :comment, :user_id,:house_id)
    end 
end
