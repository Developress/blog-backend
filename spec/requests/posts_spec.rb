require 'rails_helper'

RSpec.describe "Blog Api", type: :request do
  describe "GET /posts" do
      before { get '/posts' }

      it 'returns posts' do
        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
      end
  end

  describe 'GET /posts/:id' do
    let(:post_id) { Post.first.id }
    before { get "/posts/#{post_id}" }

    context 'when the record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  describe 'POST /posts' do
    let(:valid_attributes) { { title: 'New post', text: 'New post', user_id: 1, category_id:1 } }

    context 'when the request is valid' do
      before { post '/posts', params: valid_attributes }

      it 'creates a post' do
        expect(json['title']).to eq('New post')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/posts', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Category must exist, User must exist, Text can't be blank, User can't be blank, Category can't be blank/)
      end
    end
  end

  describe 'PUT /posts/:id' do
    let(:post_id) { Post.first.id }
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    let(:post_id) { Post.first.id }
    before { delete "/posts/#{post_id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end