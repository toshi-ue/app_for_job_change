require 'rails_helper'

RSpec.describe "Managecuisines", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/managecuisines/new"
      expect(response).to have_http_status(:success)
    end
  end

end
