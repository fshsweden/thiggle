class DashboardController < ApplicationController

  def index
  	@conversations = current_user.mailbox.inbox.page(params[:page]).per(9)
    respond_to do |format|
	  format.html { render @conversations if request.xhr? }
    end
  end

  def mailbox
   	@conversations = current_user.mailbox.inbox.page(params[:page]).per(9)
    respond_to do |format|
	  format.html { render @conversations if request.xhr? }
    end
  end 	

end
