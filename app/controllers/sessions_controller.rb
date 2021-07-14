class SessionsController < ApplicationController

    def login

    end

    def create
        # byebug
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            flash[:errors] = ["wrong username or password"]
            redirect_to login_path
        end
    end

    def logout
        session.clear
        redirect_to new_user_path
    end

end
