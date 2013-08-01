class UserMailer < ActionMailer::Base
  default from: "\"Thiggle\" <no-reply@thiggle.com>"

  def conversation_email(user)
    @user = user
    @url = 'http://www.thiggle.com/dashboard/mailbox'
    mail(to: @user.email, subject: "You have a new message")
 
  end

  def comment_email(comment)
  	@comment = comment
  	@commenter = User.find(@comment.user_id)
  	@post = Post.find(@comment.post_id)
  	@user = User.find(@post.user_id)
  	@url = "http://www.thiggle.com/posts/#{@post.id}"
  	mail(to: @user.email, subject: "You have a new question on " + @post.title)
  end


end