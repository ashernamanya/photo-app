class Article <ActiveRecord::Base 
  include PublicActivity::Common
 
    belongs_to :user
    #has_many :article_categories
    #has_many :categories, through: :article_categories
    validates :tittle, presence:true, length: {minimum:5, maximum:50}
    validates :description, presence:true, length:{minimum: 3, maximum: 10000}
    validates :user_id, presence: true 
    has_many :comments
    has_many :notifications, dependent: :destroy
    #acts_as_commontable
    #scope :of_followed_users, -> (following_users) { where user_id: following_users }
  scope :published, ->{ where(:published => true)}
#   scope :random, -> { order(Arel::Nodes::NamedFunction.new('RANDOM', [])) }


# Article.random.limit(10)
# Article.active.random.limit(10)
  #scope :published_pending, ->{where(:published => false)}
  #scope :visible, -> {where(:visible => true)}
 #scope :pending,  where(:published => true)
end 

def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
          
end 

def suggestions
    @articles = Article.paginate(page: params[:page], per_page: 1).order('RANDOM()').limit(1)
end


