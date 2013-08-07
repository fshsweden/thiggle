class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  after_initialize :init
  acts_as_messageable
  has_many :posts, :dependent => :destroy
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, :with => /^[A-Za-z\d_]+$/
  accepts_nested_attributes_for :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :rep, :posts_attributes
  attr_accessible :role_ids, :as => :admin
  attr_accessor :login

  #overrides default devise authentication method stack
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def sendit(user, subject, message)
    self.send_message(user, subject, message)
  end
  
def init
  self.rep ||= 10
end
    
def name
	return self.username
end

def mailboxer_email(object)
	return self.email	
end


  # attr_accessible :title, :body



end
