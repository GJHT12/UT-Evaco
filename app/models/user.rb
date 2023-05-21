class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  attachment :profile_image

  has_many :evaluations, dependent: :destroy
  has_many :opinions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name,
    uniqueness: true,
    presence: true,
    length: { maximum: 20 }
end
