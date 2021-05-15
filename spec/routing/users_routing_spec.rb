require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'routes' do
    it "routes to #login via POST" do
      expect(post: "/login").to route_to("users#login")
    end
  end
end

