class HousesController < ApplicationController


    # t.string :adress
    # t.string :comment
    def index
        @houses = House.all
      end

      def new
        @house = House.new
        # @house.guests.build(:name)
      end


      
      def create
        # @house = current_user.guests.build(house_params)
         @house = House.create(house_params)
        redirect_to house_path(@house)
      end
    
      def show
        @house = House.find_by(id: params[:id])
       
      end
    
    
    
      def edit
        @house = House.find_by(id: params[:id])
       
      end
    
      def update
        @house = House.find_by(id: params[:id])
        @house.update(house_params)
        redirect_to house_path(@house)
      end
    
      private
        def house_params
          params.require(:house).permit( :adress, :comment, 
          guests_attributes:[:name, :phone_number, :adress, :email, :time_line, :comment, :user_id,:house_id]
          )
        end
    end






   