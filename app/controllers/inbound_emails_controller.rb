class InboundEmailsController < ApplicationController
  def create
    if "webhooks.cloudmailin.com" == request.host
      email = InboundEmailHandler.receive(request.body.read).record
      if email.save
        head :created
      else
        render :text => email.errors.full_messages.join("\n"), :status => :unprocessable_entity
      end
    else
      head :unauthorized
    end
  end
end
