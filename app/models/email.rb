class Email < ActiveRecord::Base
  # validation
  validates :to, :from, :body, :subject, :presence => true
  
  # callbacks
  after_create :notify_user
  
  def notify_user
    # notify the user that email belongs to
    NotificationMailer.email_received(attributes.merge({
      :recipient => details.user,
      :details => details
    })).deliver
  end
  
  def details
    @details ||= TemporaryContactDetails.find_by_email(to)
  end
end
