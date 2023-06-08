class AuthMailer < ApplicationMailer
    def send_email(user)
      @user=user
      @name=user.name
      mail(to: @user.email,subject: "hi i am kang")
    end
end

