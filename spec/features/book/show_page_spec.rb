require 'rails_helper'

context 'user visits' do
  context 'book show page' do
    scenario 'they see the books title and list of reviews' do
      book = Book.create(title: 'Shrek')
      user = User.create(name: 'Farquad')
      review1 = Review.create(body: 'bad review', score: 1, user_id: user.id)
      review2 = Review.create(body: 'good review', score: 5, user_id: user.id)
      review3 = Review.create(body: 'neutral review', score: 3, user_id: user.id)

      book.reviews << review1
      book.reviews << review2
      book.reviews << review3

      visit book_path(book)

      expect(page).to have_content(book.title)
      expect(page).to have_content(review1.body)
      expect(page).to have_content(review1.score)
      expect(page).to have_content(review1.user.name)
      expect(page).to have_content(review2.body)
      expect(page).to have_content(review2.score)
      expect(page).to have_content(review2.user.name)
      expect(page).to have_content(review3.body)
      expect(page).to have_content(review3.score)
      expect(page).to have_content(review3.user.name)
    end

    scenario 'the book has an average rating' do
      book = Book.create(title: 'Shrek')
      user = User.create(name: 'Farquad')
      review1 = Review.create(body: 'bad review', score: 2, user_id: user.id)
      review2 = Review.create(body: 'good review', score: 4, user_id: user.id)
      review3 = Review.create(body: 'neutral review', score: 3, user_id: user.id)

      book.reviews << review1
      book.reviews << review2
      book.reviews << review3

      visit book_path(book)

      expect(page).to have_content(book.average_rating)
    end

    scenario 'the book has a max rating' do
      book = Book.create(title: 'Shrek')
      user = User.create(name: 'Farquad')
      review1 = Review.create(body: 'bad review', score: 2, user_id: user.id)
      review2 = Review.create(body: 'good review', score: 4, user_id: user.id)
      review3 = Review.create(body: 'neutral review', score: 3, user_id: user.id)

      book.reviews << review1
      book.reviews << review2
      book.reviews << review3

      visit book_path(book)

      expect(page).to have_content(book.max_rating.score)
      expect(page).to have_content(book.max_rating.body, count: 2)
      expect(page).to have_content(book.max_rating.user.name)

    end

    scenario 'the book has a min rating' do
      book = Book.create(title: 'Shrek')
      user = User.create(name: 'Farquad')
      review1 = Review.create(body: 'bad review', score: 2, user_id: user.id)
      review2 = Review.create(body: 'good review', score: 4, user_id: user.id)
      review3 = Review.create(body: 'neutral review', score: 3, user_id: user.id)

      book.reviews << review1
      book.reviews << review2
      book.reviews << review3

      visit book_path(book)

      expect(page).to have_content(book.min_rating.score)
      expect(page).to have_content(book.min_rating.body, count: 2)
      expect(page).to have_content(book.min_rating.user.name)
    end
  end
end