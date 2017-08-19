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
    mail to: email, subject: "Do you approve this comment?"
  end

  def text_approval(text)
    email = 'foodbylags@gmail.com'
    @text = text
    @text = text.text
    @id = text.id
    @comment_id = text.comment_id
    mail to: email, subject: "Do you approve of this comment"
  end


end
