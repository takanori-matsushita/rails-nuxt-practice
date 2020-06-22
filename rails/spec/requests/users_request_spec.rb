require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:all) do
    @user = create(:michael)
    @other_user = create(:sterling)
    create(:lana)
    create(:malory)
    30.times { |n| create("users#{n}".to_sym) }
  end
  
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
  
  it "unsuccessful edit" do
    patch user_path(@user), headers: authenticated_header(@user),
    params: {
      user: {
        name:  "",
        email: "foo@invalid",
        password:              "foo",
        password_confirmation: "bar"
      }
    }
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json).to include "error"
  end
  
  it "successful edit" do
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), headers: authenticated_header(@user),
    params: {
      user: {
        name: name,
        email: email,
        password: "",
        password_confirmation: "",
      }
    }
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json).to include "name" => name
    expect(json).to include "email" => email
  end
  
  it "should error index when not logged in" do
    get users_path
    expect(response.status).to eq 401
    json = JSON.parse(response.body)
    expect(json).to include "errors"
  end
  
  it "index including pagination" do
    get users_path, headers: authenticated_header(@user)
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json.length).to eq 30
    expect(json).to_not include "password_digest"
  end

  it "should not allow the admin attribute to be edited via the web" do
    patch user_path(@other_user), headers: authenticated_header(@other_user),
    params: {
      user: {
        password: "foobar",
        password_confirmation: "foobar",
        admin: true
      }
    }
    expect(@other_user.admin).to_not be_truthy
  end

  it "should not destroy when not logged in" do
    expect{
      delete user_path(@user)
    }.to_not change(User, :count)
  end

  it "should not destroy when logged in as a non-admin" do
    expect{
      delete user_path(@user), headers: authenticated_header(@other_user)
    }.to_not change(User, :count)
  end

  it "should destroy when logged in as a admin" do
    expect{
      delete user_path(@other_user), headers: authenticated_header(@user)
    }.to change(User, :count).by(-1)
  end
end
