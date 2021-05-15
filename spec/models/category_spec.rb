require 'rails_helper'
RSpec.describe Category, type: :model do
  context 'validations' do
    it 'accepts a valid category' do
      category = Category.new(name: 'Sport')
      expect(category.save).to be(true)
    end

    it 'validates presence of name' do
      category = Category.new
      expect(category.save).to be(false)
    end
    it 'validates length of name' do
      category = Category.new(name: 'A' * 51)
      expect(category.save).to be(false)
    end
    it 'validates a name is not too short' do
      category = Category.new(name: 'Hi')
      expect(category.save).to be(false)
    end
  end
end

