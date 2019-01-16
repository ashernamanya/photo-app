class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   #include Gravtastic # this is for the Image at Gravtor
#gravtastic
 devise :database_authenticatable, :registerable, 
         :confirmable,
         :recoverable, :rememberable, :validatable
         
 has_one :payment # payements solution for credit cards via stripe
 has_many :images

accepts_nested_attributes_for :payment 

    #attr_accessible :email, :password
has_many :articles, dependent: :destroy
#has_many :relationships, foreign_key: "follower_id", dependent: :destroy
has_many :conversations, :foreign_key => :sender_id

 has_many :active_relationships, foreign_key: "follower_id", class_name:  "Relationship", dependent:  :destroy
 has_many :passive_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent: :destroy
 
 has_many :following, through: :active_relationships, source: :followed
 
 has_many :followers, through: :passive_relationships, source: :follower
 has_many :notifications, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
 #has_many :following, through: :passive_relationships, source: :followed

#has_many :comments, dependent: :destroy
# before_save { self.email = email.downcase }

# validates :first_name, presence: true, length: {minimum: 3, maximum: 15}
# validates :last_name, presence: true,length: {minimum: 3, maximum: 15}
# validates :country, presence: true, length: {minimum: 3, maximum: 15}
# validates :username, presence: true, uniqueness:{case_sensitive: false }, length: {minimum: 3, maximum: 25}
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format:{ with:VALID_EMAIL_REGEX}

# has_secure_password
# validates :password, length: {minimum: 5 }
    
 #acts_as_commontator
def generate_password_token!
  self.reset_password_token = generate_token
  self.reset_password_sent_at = Time.now.utc
  save!
end

def password_token_valid?
  (self.reset_password_sent_at + 4.hours) > Time.now.utc
end

def reset_password!(password)
  self.reset_password_token = nil
  self.password = password
  save!
end

 def except_current_user(users)
    users.reject { |user| user.id == self.id }
 end   



def follow(user)
    active_relationships.create(followed_id: user.id)
end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
 
private

def generate_token
  SecureRandom.hex(10)
end

  def self.search(param)
    return User.none if param.blank?
    
    param.strip!
    param.downcase!
    (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  end
  
  def self.first_name_matches(param)
    matches('first_name', param)
  end
  
  def self.last_name_matches(param)
    matches('last_name', param)
  end
  
  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
 

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
         #has_many :user_stocks
         #has_many :stocks, through: :user_stocks
        
         
# validates_presence_of :invitation_id, :message => 'is required'
# validates_uniqueness_of :invitation_id

# has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
#belongs_to :invitation
#belongs_to :pages

# before_create :set_invitation_limit


def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
end
  
  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end
  
  def under_stock_limit?
    (user_stocks.count < 10)
  end
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
  
  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end
  
  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
  
  def self.search(param)
    return User.none if param.blank?
    
    param.strip!
    param.downcase!
    (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  end
  
  def self.first_name_matches(param)
    matches('first_name', param)
  end
  
  def self.last_name_matches(param)
    matches('last_name', param)
  end
  
  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end




def invitation_token
  invitation.token if invitation
end

def invitation_token=(token)
  self.invitation = Invitation.find_by_token(token)
end

private

def set_invitation_limit
  self.invitation_limit = 1000000000000000
end