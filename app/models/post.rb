class Post < ActiveRecord::Base
      mount_uploader :attachment, PictureUploader
  belongs_to :user
end
