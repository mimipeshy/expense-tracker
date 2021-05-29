# spec/requests/reviews_spec.rb
require 'rails_helper'

RSpec.describe 'Reviews API' do
  # Initialize the test data
  let!(:book) { create(:book) }
  let!(:review) { create_list(:review, 1, book_id: book.id) }
  let(:book_id) { book.id }
  let(:id) { review.first.id }

  # Test suite for GET /books/:book_id/reviews
  describe 'GET /reviews/:book_id/' do
    before { get "/reviews/#{book_id}" }

    context 'when book exists' do
      it 'returns all book reviews' do
        expect(json.size).to eq(1)
      end
    end

    context 'when book does not exist' do
      let(:book_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Review with 'id'=0/)
      end
    end
  end
  # Test suite for PUT /reviews
  describe 'POST /reviews/' do
    let(:valid_attributes) { { title: 'Visit Narnia', description:"not a nice book", score: 2, book_id:1 } }

    context 'when an invalid request' do
      before { post "/reviews/", params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Book must exist, Description can't be blank, Score can't be blank/)
      end
    end
  end

  # Test suite for PUT /reviews/:id
  describe 'PUT /reviews/:id/' do
    let(:valid_attributes) { { title: 'Mozart' } }

    before { put "/reviews/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_review = Review.find(id)
        expect(updated_review.title).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Review with 'id'=0/)
      end
    end
  end

  # Test suite for DELETE /reviews/:id
  describe 'DELETE /reivews/:id' do
    before { delete "/reviews/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end