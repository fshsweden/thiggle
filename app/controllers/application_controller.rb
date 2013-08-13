class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_var
  #redirect to same page after signing in
  def after_sign_in_path_for(resource)
    posts_path
  #     sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
  #     if request.referer == sign_in_url
  #       super
  #     else
  #       stored_location_for(resource) || request.referer || root_path
  #     end
  end

  private
  
  def set_var
	 if user_signed_in?
		@messages_unread = current_user.mailbox.inbox(unread: true).count
    @messages_unread_text = current_user.mailbox.inbox(unread: true).count.to_s + " Unread"
		@display_username = "@#{current_user.username}"
	 end
  
  end
  
  

  
end
