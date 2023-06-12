class SessionsController < ApplicationController
    def new
        
    end
    def create
      user = User.where(email: params[:session][:email]).last
        if user && user.activated == true && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to users_show_path(user)
        else
           flash[:warning] = "Check your email for the activation link."
           redirect_to root_url
        end
    end
end
