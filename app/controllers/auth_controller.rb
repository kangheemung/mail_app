class AuthController < ApplicationController
    
 
    def confirm
     @email =params[:mail]
    end
    def activate_user
      user=User.where('email like ?',"#{params[:mail]}%").last
      if user != nil && user.activated == nil
        user.activated = true
        user.save
        session[:user] = user
        redirect_to users_show_path(user.id)
        
      elsif user != nil &&user.activated != nil
      #flash you are already logged in.
        redirect_to root_path
      else
         #flash you are not signed in yet.
      redirect_to root_path
      end
    end

end