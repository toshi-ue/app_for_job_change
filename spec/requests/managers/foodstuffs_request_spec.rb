require 'rails_helper'

RSpec.describe "Managers::Foodstuffs", type: :request do
  before do
    manager = create(:manager)
    sign_in manager
    get root_path
    @cuisine = create(:cuisine)
  end

  describe "GET /index" do
  end

  describe "GET /new" do
    it "リクエストが成功すること" do
      get new_managers_foodstuff_path(cuisine_id: @cuisine.id)
      expect(response.status).to eq 200
    end

    it "newテンプレートで表示されること" do
      get new_managers_foodstuff_path(cuisine_id: @cuisine.id)
      expect(response.body).to include "食材を検索"
    end
  end

  describe "POST #create" do
    it "リクエストが成功すること" do
      post managers_foodstuffs_path, params: {
        foodstuff: FactoryBot.attributes_for(:foodstuff, cuisine_id: @cuisine.id)
      }
      expect(response.status).to eq 302
    end

    it "新規レコードが作成されること" do
      expect do
        post managers_foodstuffs_path, params: { foodstuff: attributes_for(:foodstuff, cuisine_id: @cuisine.id)}
      end.to change(Foodstuff, :count).by(1)
    end
  end
end
