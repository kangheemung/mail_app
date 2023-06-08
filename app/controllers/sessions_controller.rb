class SessionsController < ApplicationController
    def new
        
    end
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticated?(:activation, params[:id])
            log_in(@user)
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
            redirect_to users_show_path(@user)
        else
           flash[:warning] = "Check your email for the activation link."
           redirect_to root_url
        end
    end
end
