class SessionsController < ApplicationController

    def login

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        redirect_to @user
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
