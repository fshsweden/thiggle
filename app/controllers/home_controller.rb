class HomeController < ApplicationController
  def index
  end

  def dashboard
    @conversations = current_user.mailbox.conversations.page(params[:page]).per(9)
    respond_to do |format|
	  format.html { render @conversations if request.xhr? }
    end
  end
end
