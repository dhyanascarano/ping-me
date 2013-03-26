class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def email_received(params)
    @data = params.symbolize_keys
    mail({
      :to => params[:recipient].email,
      :subject => params[:subject]
    })
  end
end
