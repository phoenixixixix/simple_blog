class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 }
end
