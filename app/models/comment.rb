class Comment < ActiveRecord::Base
  belongs_to :article
  include PublicActivity::Common
  
end
