class ConversationsController < ApplicationController
  def new
    @conversation = Conversation.new
    @find_user = params[:to]
    @user = User.find_by_username(@find_user)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conversation }
    end
  end
  
  def create
    @mess = params[:message]
    @sub = params[:subject]
    current_user.send_message(@user, @mess, @sub)
  end
  
  def index
    @to = params[:to]
    @subject = params[:subject]
  end
end
