class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :liked_movies, through: :likes, source: :movie
  
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 


  def already_liked?(movie)
    self.likes.exists?(movie_id: movie.id)
  end
  


end
