class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buddy_requests, dependent: :destroy
  has_many :sports
  has_many :favorite_sports, dependent: :destroy, source: :sports
  has_many :conversations
  has_one_attached :photo

end
