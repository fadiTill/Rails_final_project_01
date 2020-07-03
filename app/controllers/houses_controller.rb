class HousesController < ApplicationController


    # t.string :adress
    # t.string :comment
    def index
        @houses = Houses.all
      end

      def new
        @house = House.new
      end

      def create
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
          params.require(:house).permit( :adress, :comment)
        end
    end






   