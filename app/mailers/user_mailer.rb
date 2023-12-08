class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to my app")do |format| format.html { render 'welcome_email' } end
  end

  def morning_greeting_email
     @users = User.all
    @users.each do |user|
      mail(to: user.email, subject: "Good Morning, #{user.email}!")
    end
  end
end
