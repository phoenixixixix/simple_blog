class Post < ApplicationRecord
  belongs_to :category
  accepts_nested_attributes_for :category

  validates :text, presence: true

  before_save :set_title

  def set_title
    self.title = "Title - #{Post.count + 1}"
  end
end
