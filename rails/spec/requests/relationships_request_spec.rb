require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  before(:each) do
    @user = create(:michael)
    @sterling = create(:sterling)
    @lana = create(:lana)
    @malory = create(:malory)
    @followed_lana = @user.active_relationships.create(followed_id: @lana.id)
    @followed_malory = @user.active_relationships.create(followed_id: @malory.id)
    @follower_lana = @lana.active_relationships.create(followed_id: @user.id)
    @follower_sterling = @sterling.active_relationships.create(followed_id: @user.id)
  end

  it "should render json following when not logged in" do
    get following_user_path(@user)
    expect(response).to have_http_status(:unauthorized)
  end

  it "should render json followers when not logged in" do
    get followers_user_path(@user)
    expect(response).to have_http_status(:unauthorized)
  end

  it "following json" do
    get following_user_path(@user), headers: authenticated_header(@user)
    expect(@user.following.empty?).to be_falsey
    json = JSON.parse(response.body)
    expect(@user.following.count).to eq json["following"].count
    @user.following.zip(json["following"]) do |user, followed|
      expect(user.name).to eq followed["name"]
    end
  end

  it "followers json" do
    get followers_user_path(@user), headers: authenticated_header(@user)
    expect(@user.followers.empty?).to be_falsey
    json = JSON.parse(response.body)
    expect(@user.followers.count).to eq json["followers"].count
    @user.followers.zip(json["followers"]) do |user, follower|
      expect(user.name).to eq follower["name"]
    end
  end

  it "create should require logged-in user" do
    expect{
      post relationships_path
    }.to_not change(Relationship, :count)
    expect(response).to have_http_status(:unauthorized) 
  end

  it "destroy should require logged-in user" do
    expect{
      delete relationship_path(@followed_lana)
    }.to_not change(Relationship, :count)
    expect(response).to have_http_status(:unauthorized)
  end

  it "should follow a user with json" do
    expect{
      post relationships_path, headers: authenticated_header(@user),
      params: {
        relationship: {
          followed_id: @sterling.id
        }
      }
    }.to change(Relationship, :count).by(1)
  end

  it "should unfollow a user with json" do
    expect{
      delete relationship_path(@followed_lana), headers: authenticated_header(@user)
    }.to change(Relationship, :count).by(-1)
  end
end
