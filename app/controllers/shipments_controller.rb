class ShipmentsController < ApplicationController
    before_action :set_shipment, only: [:edit, :update, :show]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @shipments = Shipment.search(params[:search]).paginate(page: params[:page], per_page: 5)
    end

    def show
        
    end

    def new
        @shipment = Shipment.new
    end

    def create
        @shipment = Shipment.new(shipment_params)
        @shipment.user = current_user

        if @shipment.save
            flash[:success] = "Your Shipment request has been submitted!"
            redirect_to shipments_path
        else
            render :new
        end
    end

     def edit
        
    end

    def update
        if @shipment.update(shipment_params)
            flash[:success] = "Your shipment was updated successfully!"
            redirect_to shipment_path
        else
            render :edit
        end
    end

    def destroy
        Shipment.find(params[:id]).destroy
        flash[:success] = "Shipment Deleted"
        redirect_to shipments_path
    end


    private

        def shipment_params
            params.require(:shipment).permit(:title, :pcountry, :pstate, :pcity, :paddress, :pzipcode, :dcountry, :dstate,
                                             :dcity, :daddress, :dzipcode, :weight, :heigth, :width, :length, :delday, 
                                             :delmonth, :delyear, :picture)
        end

        def set_shipment
            @shipment = Shipment.find(params[:id])
        end

        def require_same_user
            if current_user != @shipment.user and !current_user.admin?
                flash[:danger] = "You can only edit your own shipments"
                redirect_to shipments_path
            end
        end

end

