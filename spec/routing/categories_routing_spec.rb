require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'routes' do
    it "routes to #index via GET" do
      expect(get: "/categories").to route_to("categories#index")
    end
  end
end

