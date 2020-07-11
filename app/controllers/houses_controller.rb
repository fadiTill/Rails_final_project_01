class HousesController < ApplicationController

  #  http_basic_authenticate_with name: "@user.name", password: "@user.password", only: :update

   before_action :require_login
  


    def index
        #  @houses = House.all.order
        @houses = House.all
    end


      def show  
        @house = House.find_by(id: params[:id])
      end
    
    
      # @person.addresses.build(address_type: 'work')
      def new
         @house = House.new
      end

      def edit
         @house = House.find_by(id: params[:id])
        # @house = House.find_by( params[:id])
      end


      
      def create
         @house = House.create(house_params)
         if @house.save
        #  redirect_to house_path(@house)
        redirect_to @house
         else
          render 'new'
      end
    end
    
      def update
        @house = House.find_by(id: params[:id])
       if  @house.update(house_params)
        redirect_to @house
       else
        render 'edit'
       end 
      end
        # redirect_to house_path(@house)
      

#destroy will destroy  the house and all guest associate with it to avoid bad data to persist.
      def destroy
        @house = House.find( params[:id])
        @house.destroy
        redirect_to houses_path
      end
    
      private
        def house_params
          params.require(:house).permit( :adress, :comment,
          guests_attributes:[:name, :phone_number, :adress, :email, :time_line, :comment, :user_id,:house_id]
          )
        end


         def require_login
          #  return head(:forbidden) unless session.include? :user_id
          return head(:forbidden) unless logged_in?

         end
    end






   