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

  def welcome(params)
    @user = user
    @appname = "Frankie's Frukt"
    mail( to: user.email,
          subject: "Welcome to #{@appname}!")
  end


end
