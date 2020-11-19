class UserMailer < ApplicationMailer
  def confirm_email
    @organization = params[:organization]
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Origin')
  end
end
