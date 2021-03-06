
class UsersController < ApplicationController

    # before_action :redirect_if_not_logged_in
    def new
        # render :layout => "signup"
        @user = User.new
    end

    def index
        @users = User.all
        # binding.pry
    end
    
    def create
        
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        # binding.pry
        redirect_to '/login' if !@user
    end

    private

    def user_params

        params.require(:user).permit(:username, :email, :password, :password_confirmation)

    end
end
