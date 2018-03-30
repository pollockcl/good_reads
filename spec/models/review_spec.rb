require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it 'must have a body' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(score: 5)

      book.reviews << review

      expect(review).to_not be_valid
    end

    it 'must have a score' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book')

      book.reviews << review

      expect(book).to be_valid
    end

    it 'is valid with all attributes' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book')

      book.reviews << review

      expect(book).to be_valid
    end
  end

  describe 'relationships' do
    it 'belongs to a user' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book', score: 2)

      book.reviews << review

      expect(review).to respond_to(:user)
      expect(review.user.name).to eq(user.name)
    end

    it 'belongs to a book' do
      user = User.create(name: 'Farquad')
      book = Book.create(title: 'Shrek')
      review = user.reviews.create(body: 'bad book', score: 2)

      book.reviews << review

      expect(review).to respond_to(:book)
      expect(review.book.title).to eq(book.title)
    end
  end
end
