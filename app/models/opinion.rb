class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :evaluation

  validates :opinion,
    presence: { message: "(or your comment) can't be blank" },
    length: { maximum: 60 }

end
