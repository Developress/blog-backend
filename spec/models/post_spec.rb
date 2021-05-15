require 'rails_helper'
RSpec.describe Post, type: :model do
  context 'validations' do
    it 'accepts a valid post' do
      post = Post.new(title: 'A decent title', text: 'Some body', user_id: 1, category_id: 1)
      expect(post.save).to be(true)
    end

    it 'validates presence of title' do
      post = Post.new(text: 'Some body', user_id: 1, category_id: 1)
      expect(post.save).to be(false)
    end
    it 'validates length of title' do
      post = Post.new(title: 'A' * 51, text: 'Some body', user_id: 1, category_id: 1)
      expect(post.save).to be(false)
    end
    it 'validates presence of text' do
      post = Post.new(title: 'A decent title', user_id: 1, category_id: 1)
      expect(post.save).to be(false)
    end
    it 'validates a title is not too short' do
      post = Post.new(title: 'Hi', text: 'Some body', user_id: 1, category_id: 1)
      expect(post.save).to be(false)
    end
  end
end
