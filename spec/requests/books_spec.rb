require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  # add books owner
  let(:user) { create(:user) }
  let!(:books) { create_list(:book, 10, created_by: user.id) }
  let(:book_id) { books.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /books' do
    # update request with headers
    before { get '/books', params: {}, headers: headers }

    # [...]
  end

  describe 'GET /books/:id' do
    before { get "/books/#{book_id}", params: {}, headers: headers }
    # [...]
    end
    # [...]
  end

  describe 'POST /books' do
    let(:valid_attributes) do
      # send json payload
      { title: 'Learn Elm', created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/books', params: valid_attributes, headers: headers }
      # [...]
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/books', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
  end

  describe 'PUT /books/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/books/#{book_id}", params: valid_attributes, headers: headers }
      # [...]
    end
  end

  describe 'DELETE /books/:id' do
    before { delete "/books/#{book_id}", params: {}, headers: headers }
    # [...]
  end
end