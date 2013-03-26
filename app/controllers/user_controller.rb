class UserController < ApplicationController
  def update
    current_user.update_attributes(params[:user])
    redirect_to :root
  end
end
