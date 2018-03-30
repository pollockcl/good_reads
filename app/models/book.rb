class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.sum(:score) / reviews.size
  end
end
