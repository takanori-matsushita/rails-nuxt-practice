require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  before(:each) do
    @user = create(:michael)
  end

  describe "GET /home" do
    it "returns http unauthorized" do
      get "/home"
      expect(response).to have_http_status(:unauthorized) 
    end

    it "returns http success" do
      get "/home", headers: authenticated_header(@user)
      expect(response).to have_http_status(:success)
    end
  end

end
