class Email < ActiveRecord::Base
  # validation
  validates :to, :from, :body, :subject
  
  # callbacks
  after_create :notify_user
  
  def notify_user
    # find the temporary email
    details = TemporaryContactDetails.find_by_email(to)
    # notify the user that email belongs to
    NotificationMailer.email_received(attributes.merge({
      :recipient => details.user,
      :details => details
    })).deliver
  end
end
