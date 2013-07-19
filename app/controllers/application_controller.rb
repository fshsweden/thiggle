class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_var


  private
  
  def set_var
	 if user_signed_in?
		@messages_unread = current_user.mailbox.inbox(unread: true).count
		@display_username = current_user.username
	 end
  
  end
  
end
