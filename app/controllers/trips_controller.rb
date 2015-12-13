class TripsController < ApplicationController
    before_action :set_trip, only: [:edit, :update, :show]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @trips = Trip.search(params[:search]).paginate(page: params[:page], per_page: 5)
    end

    def new
      @trip = Trip.new
    end 

    def show
      
    end
   
   def create
      @trip = Trip.new(trip_params)
      @trip.user = current_user

      if @trip.save
        flash[:success] = "Oh yea! Your Trip were created succesfully!"
        redirect_to trips_path
      else
        render :new
      end
    end

    def edit
        
    end

    def update
        if @trip.update(trip_params)
            flash[:success] = "Your trip information was updated successfully!"
            redirect_to trip_path(@trip)
        else
            render :edit
        end
    end

    def destroy
        Trip.find(params[:id]).destroy
        flash[:success] = "Trip Deleted"
        redirect_to trips_path
    end



    private

        def trip_params
         params.require(:trip).permit(:icountry, :istate, :icity, :iaddress, :izipcode, :fcountry, :fstate, :fcity, :faddress, :fzipcode, :day, :month, :year, :maxweight, :maxheigth, :maxwidth, :maxlength)
        end

        def set_trip
            @trip = Trip.find(params[:id])
        end

        def require_same_user
            if logged_in?
                if current_user != @trip.user and !current_user.admin?
                    flash[:danger] = "You can only edit your own trips"
                    redirect_to root_path
                end
            else
                flash[:danger] = "You have to be logged in"
                redirect_to root_path  
            end
        end

end


