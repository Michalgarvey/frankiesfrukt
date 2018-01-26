class UserRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end

  def welcome
    @name = params[:name]
    @email = params[:email]
    ActionMailer::Base.mail(from: "frankie@frankiesfrukt.se",
      to: email,
      subject: "Welcome to #{@appname}!",
      body: welcome).deliver_now
  end

end
