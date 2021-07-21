class SessionsController < ApplicationController

    def login
    end

    def omniauth
        # binding.pry
        user_info = request.env['omniauth.auth']["info"]
        user = User.find_or_create_by_google(user_info)
        if user
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
        # user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
        #     u.username = request.env['omniauth.auth'][:info][:first_name]
        #     # binding.pry
        #     u.email = request.env['omniauth.auth'][:info][:email]
        #     u.password = SecureRandom.hex(15)
        # end
        # if user.valid?
        #     session[:user_id] = user.id
        #     redirect_to user_path(user)
        # else
        #     redirect_to login_path
        # end
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
        redirect_to login_path
    end

end
