class HousesController < ApplicationController

      http_basic_authenticate_with name: "@user.name", password: "@user.password", only: :show

      before_action :require_login
    


      def index
          @houses = House.all
      end

      
        def show  
          @house = House.find_by(id: params[:id])
        end
      
      
        
        def new
          @house = House.new
        end

        def edit
          @house = House.find_by(id: params[:id])
        
        end


        
        def create
  #      render plain: params[:article].inspect
  #    end
          @house = House.create(house_params)
          if @house.save
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
        
        

  #destroy will destroy  the house and all guests associate with it to avoid bad data to persist.
        def destroy
          @house = House.find( params[:id])
          @house.destroy
          redirect_to houses_path
        end
      
        private
          def house_params
            params.require(:house).permit( :adress, :comment)
          end


          def require_login
            # return head(:forbidden) unless session.include? :user_id
            return head(:forbidden) unless logged_in?
          end
      end






    