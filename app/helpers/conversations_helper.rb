module ConversationsHelper
  
  def get_sender(sender_id)
    return User.find(sender_id).username
  end
  
  
end
