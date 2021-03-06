class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    UserMailer.contact_form(@name, @email, @message).deliver_now

  end

  

end
