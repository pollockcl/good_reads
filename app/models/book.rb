class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.sum(:score) / reviews.size
  end

  def max_rating
    reviews.order(:score).limit(1).first.score
  end

  def min_rating
    reviews.order(score: :desc).limit(1).first.score
  end
end
