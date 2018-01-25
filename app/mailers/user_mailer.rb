class UserMailer < ApplicationMailer
  default from: "frankie@frankiesfrukt.se"

  def contact_form(email, name, message)
    @message = message
      mail( from: email,
            to: 'michalgarvey@gmail.com',
            subject: "#{name} got in touch!")
  end

  def welcome(user)
    @appname = "Frankie's Frukt"
    mail( to: email,
          subject: "Welcome to #{@appname}!")
  end

end
