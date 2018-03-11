class UserMailer < ApplicationMailer
  default from: "frankie@frankiesfrukt.se"

  def contact_form(name, email, message)
    @name = name
    @email = email
    @message = message

      mail( from: email,
            to: 'michalgarvey@gmail.com',
            subject: "#{name} got in touch!")
  end

  def welcome(user)
    @user = user
    @appname = "Frankies Frukt"
    mail( to: user.email,
          subject: "Welcome to #{@appname}!")
  end

  def payment_recieved(user, product)
    @user = user
    @appname = "Frankies Frukt"
    @product = product.name
    mail( to: user.email,
          subject: "Thanks for your order with #{@appname}!")
  end


end
