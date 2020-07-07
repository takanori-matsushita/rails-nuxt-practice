require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before(:each) do
    @user = create(:michael)
    create(:orange, user: @user)
    create(:tau_manifesto, user: @user)
    create(:cat_video, user: @user)
    @micropost = create(:most_recent, user: @user)
  end

  it "should be valid" do
    expect(@micropost).to be_valid
  end

  it "user id should be present" do
    @micropost.user_id = nil
    expect(@micropost).to_not be_valid  
  end

  it "content should be present" do
    @micropost.content = "   "
    expect(@micropost).to_not be_valid
  end

  it "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    expect(@micropost).to_not be_valid
  end

  it "order should be most recent first" do
    expect(@micropost).to eq Micropost.first
  end
end
