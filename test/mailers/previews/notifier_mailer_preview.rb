# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/order_received
  def order_received
    NotifierMailer.order_received
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/order_shipped
  def order_shipped
    NotifierMailer.order_shipped
  end

end
