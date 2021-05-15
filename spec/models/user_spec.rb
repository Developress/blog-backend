require 'rails_helper'
RSpec.describe User, type: :model do
  context 'validations' do
    it 'accepts a valid user' do
      user = User.new(username: 'olena', password: 'olena')
      expect(user.save).to be(true)
    end

    it 'validates presence of username' do
      user = User.new(password: 'olena')
      expect(user.save).to be(false)
    end
    it 'validates length of username' do
      user = User.new(username: 'A' * 51, password: 'olena')
      expect(user.save).to be(false)
    end
    it 'validates presence of password' do
      user = User.new(username: 'olena')
      expect(user.save).to be(false)
    end
    it 'validates a username is not too short' do
      user = User.new(username: 'Hi')
      expect(user.save).to be(false)
    end
  end
end

