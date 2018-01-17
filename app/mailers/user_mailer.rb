class UserMailer < ApplicationMailer
  default from: "michalgarvey@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail( from: email,
            to: 'michalgarvey@gmail.com',
            subject: "#{name} got in touch!")
  end

end
