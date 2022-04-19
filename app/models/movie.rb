class Movie < ApplicationRecord

   
   belongs_to :user
   has_many :likes, dependent: :destroy
   has_many :liked_users, through: :likes, source: :user
  
   mount_uploader :image, ImageUploader

end
