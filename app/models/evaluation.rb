class Evaluation < ApplicationRecord

  enum evaluation:{ー:0, 大仏:1, 仏:2, 並:3, 鬼:4, 大鬼:5}, _prefix: true
  enum easiness:{ー:0, 楽単:1, やや易:2, 並:3, やや難:4, 落単:5}, _prefix: true
  enum expectation:{ー:0, 優上:1, 優:2, 良:3, 可:4, 不可:5}, _prefix: true

  belongs_to :user
  has_many :opinions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :teacher_name, :class_name,
    presence: true,
    length: { maximum: 20 }

  validates :comment,
    presence: true,
    length: { maximum: 100 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end



