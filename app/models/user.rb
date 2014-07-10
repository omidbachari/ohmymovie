class User < ActiveRecord::Base
  has_many :favorite_movies, class_name: "Movie", through: :favorites
  has_many :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
