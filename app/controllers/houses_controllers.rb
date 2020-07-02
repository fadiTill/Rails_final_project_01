class HousesController < ApplicationController


    # t.string :adress
    # t.string :comment
    def index
        @houses = Houses.all
      end
    
      def show
        @house = House.find_by(id: params[:id])
        @guest= @house.guests.build(user_id: current_user.id)
      end
    
      def new
        @house = House.new
      end
    
      def create
        house = House.create(house_params)
        redirect_to house_path(house)
      end
    
      def edit
        @house = House.find_by(id: params[:id])
        @guest = @house.guests.build(user_id: current_user.id)
      end
    
      def update
        house = House.find_by(id: params[:id])
        house.update(house_params)
        redirect_to house_path(house)
      end
    
      private
        def house_params
          params.require(:attraction).permit(
            :adress,
            :comment
            
          )
        end
    end






   