class OrderMailer < ApplicationMailer
	default from: "foodbylags@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(buyer)
    @order = Order.last
    @buyer = buyer

    mail to: @buyer, subject: "Order Completed!", cc: "foodbylags@gmail.com"
  end

  def comment_approval(comment)
    email = 'foodbylags@gmail.com'
    @comment = comment
    @text = comment.text
    @id = comment.id
    mail to: email, subject: "Do you you approve this comment?"
  end



end
