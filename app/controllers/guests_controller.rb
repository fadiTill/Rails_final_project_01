class GuestsController < ApplicationController
    # before_action :require_login
    http_basic_authenticate_with name: "@user.name", password: "@user.password", only: :index



    def index
        @guests = Guest.all
    end 

    


    def new
        @guest = Guest.new
    end

    # def new
    #   @guest = Guest.new(house_id: params[:house_id])
    # end

    
   
    def create
      @guest = current_user.guests.build(guest_params)
      @house = @guest.house_id
      @guest.save
      redirect_to house_path(@house)
     end

        def show
         @guest = Guest.find_by(id: params[:id])     
    end 

    # Post.where("author_id = ?", @author.id)
    def edit 
        @guest = Guest.find_by(id: params[:id])
    end 

    # def update
    #   @guest = Guest.find(params[:id])
    #   @guest.update(guest_params)
    #   redirect_to house_path(@guest)
    # end


    def update
        @guest = Guest.find_by(id: params[:id])
        @guest.update(guest_params)
        redirect_to house_path(@guest)
      end



      

    def destroy
         @house = House.find(params[:house_id])
        @guest = @house.guests.find(params[:id])
        @guest.destroy
        redirect_to house_path(@house)
      end


  


    private 

    
    def guest_params
        params.require(:guest).permit(:name, :phone_number, :adress, :email, :time_line, :comment, :user_id,:house_id)
    end 


    def require_login
#     #  return head(:forbidden) unless session.include? :user_id
          return head(:forbidden) unless logged_in?
      end
end
