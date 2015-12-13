class UsersController < ApplicationController
    before_action :require_admin, only: [:index ]
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @users = User.search(params[:search]).paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Your account has been created successfully"
            session[:user_id] = @user.id
            redirect_to user_path(session[:user_id])
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @user.update(user_params_edit)
            if @user.authenticate(params[:user][:pass]) || current_user.admin
                flash[:success] = "Your profile has been updated successfully"
                redirect_to user_path(@user)
            else
                flash[:danger] = "You entered wrong password"
                render :edit
            end
        else
            render :edit
        end
        #render plain: params[:user][:pass]
    end


    def show
        @reviews = Review.where(user_id: @user.id)
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User Deleted"
        redirect_to users_path
    end


    private

        def user_params
           params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :password_confirmation, :picture)
        end

        def user_params_edit
            params.require(:user).permit(:firstname, :lastname, :email, :phone, :picture)
        end

        def set_user
            @user = User.find(params[:id])
        end

        def require_same_user
            if current_user == nil
                flash[:danger] = "You have to be logged in"
                redirect_to root_path
            elsif current_user != @user and !current_user.admin?
                flash[:danger] = "You can only edit your own profile"
                redirect_to root_path
            end
        end

        def require_admin
            if current_user == nil
                flash[:danger] = "You have to be logged in"
                redirect_to root_path
            elsif !current_user.admin?
                flash[:danger] = "You are not allowed to view this page"
                redirect_to root_path
            end
        end

end
