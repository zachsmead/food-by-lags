class OrderMailer < ApplicationMailer
	default from: "foodbylags@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(buyer)
    @buyer = buyer

    mail to: @buyer, subject: "Order Completed!", cc: "foodbylags@gmail.com"
  end
end
