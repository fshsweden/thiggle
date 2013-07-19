class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def index
  end

  def dashboard
    @conversations = current_user.mailbox.inbox.page(params[:page]).per(9)
    respond_to do |format|
	  format.html { render @conversations if request.xhr? }
    end
  end
end
