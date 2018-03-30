require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationships' do
    it 'belongs to a user' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book')

      book.reviews << review

      expect(review).to respond_to(:user)
      expect(review.user.name).to eq(user.name)
    end

    it 'belongs to a book' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book')

      book.reviews << review

      expect(review).to respond_to(:book)
      expect(review.book.title).to eq(book.title)
    end
  end
end
