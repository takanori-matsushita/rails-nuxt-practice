require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  before :each do
    @user = User.create(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
  end

  it "login with valid information" do
    post login_path,
    params: {
      email: @user.email,
      password: "foobar"
    }
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json).to include "email" => @user.email
    expect(json).to include "token" => JsonWebToken.encode(user_id: @user.id)
  end
end
