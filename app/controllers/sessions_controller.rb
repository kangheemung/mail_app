class SessionsController < ApplicationController
    def new
        
    end
    def create
        user=User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
             session[:user]= user.id
            redirect_to users_show_path(user)
        else
            render :new
        end
    end
end
