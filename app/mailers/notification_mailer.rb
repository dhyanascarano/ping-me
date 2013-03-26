class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def email_received(params)
    @params = params
    mail({
      :to => params[:recipient].email,
      :subject => params[:subject]
    }) do |format|
      format.text
    end
  end
end
