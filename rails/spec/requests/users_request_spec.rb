require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "invalid signup information" do
    expect{
      post users_path,
      params: {
        user: {
          name:  "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    }.to_not change(User, :count)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json).to include "error"
  end
  
  it "valid signup information" do
    expect{
      post users_path,
      params: {
        user: {
          name: "Example User",
          email: "user@example.com",
          password: "password",
          password_confirmation: "password",
        }
      }
    }.to change(User, :count)
    expect(response.status).to eq 201
    json = JSON.parse(response.body)
    expect(json).to include "name" => "Example User", "email" => "user@example.com"
  end
end
