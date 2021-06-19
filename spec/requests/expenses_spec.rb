# spec/requests/expenses_spec.rb
require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:expenses) { create_list(:expense, 7, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { expenses.first.id }

  # Test suite for GET /expenses
  describe 'GET /expenses/:user_id/' do
    before { get "/expenses/#{user_id}" }

    context 'when expense exists' do
      it 'returns all expenses' do
        expect(json.size).to eq(7)
      end
    end

    context 'when expense does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Expense with 'id'=0/)
      end
    end
  end
  # Test suite for POST /expenses
  describe 'POST /expenses' do
    let(:valid_attributes) { { name: 'Visit', amount: 300, date: '2021/6/19', user_id: 3 } }

    context 'when an invalid request' do
      before { post '/expenses', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match("{\"user\":[\"must exist\"],\"amount\":[\"can't be blank\"],\"date\":[\"can't be blank\"]}")
      end
    end
  end

  # Test suite for PUT /expenses/:id
  describe 'PUT /expenses/:id/' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/expenses/#{id}", params: valid_attributes }

    context 'when expense exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the expense' do
        updated_expense = Expense.find(id)
        expect(updated_expense.name).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Expense with 'id'=0/)
      end
    end
  end

  # Test suite for DELETE /expenses/:id
  describe 'DELETE /expenses/:id' do
    before { delete "/expenses/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
