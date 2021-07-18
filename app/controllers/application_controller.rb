class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def logged_in?
       !!session[:user_id]
    end

    def current_user
        @current_user ||= (User.find_by(id: session[:user_id]))
    end

    def redirect_if_not_logged_in
        return redirect_to(controller: 'sessions', action: 'login') unless logged_in?
    end
end
