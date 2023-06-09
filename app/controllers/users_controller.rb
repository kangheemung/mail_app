class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
       session[:user]= @user.id
       AuthMailer.send_email(@user).deliver_now
       
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user= User.find_by(id: params[:id])
  end
end
private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end