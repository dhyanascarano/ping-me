class TemporaryContactDetailsController < ApplicationController
  def index
    @details = TemporaryContactDetails.where(:user_id => current_user.id)
  end
  
  def show
    @details = TemporaryContactDetails.where(:slug => params[:id]).first
    head :not_found unless @details
  end

  def create
    @details = TemporaryContactDetails.new
    @details.user = current_user
    @details.save
    redirect_to :action => :index
  end

  def destroy
    details = TemporaryContactDetails.where({
      :user_id => current_user.id
    }).find(params[:temporary_contact_detail_id])
    details.destroy
    redirect_to :action => :index
  end
end
