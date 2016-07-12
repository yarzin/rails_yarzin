class CartMailer < ApplicationMailer
  default from: "mail@example.com"

  def cart_mail(email)
    @url = 'http://hidden-waters-73156.herokuapp.com'
    mail(to: email, subject: 'Confirm order')
  end
end

