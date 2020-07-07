require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  before(:each) do
    @user = create(:michael)
    30.times { |n| create("micropost_#{n}".to_sym, user: @user) }
  end
  
  it "profile display" do
    get user_path(@user)
    json = JSON.parse(response.body)
    expect(json['microposts'].length).to eq @user.microposts.count
    @user.microposts.page(1).per(30).each.with_index do |micropost, i|
      expect(json['microposts'][i]['content']).to eq micropost.content
    end
  end
  
  it "should render error create when not logged in" do
    expect{
      post microposts_path,
      params: {
        micropost: {
          content: "Lorem ipsum"
        }
      }
    }.to_not change(Micropost, :count)
    expect(response.status).to eq 401
    json = JSON.parse(response.body)
    expect(json).to include "errors" => "Authorization is not given."
  end

  it "should render error destroy when not logged in" do
    @micropost = create(:orange, user: @user)
    expect{
      delete micropost_path(@micropost)
    }.to_not change(Micropost, :count)
    expect(response.status).to eq 401
    json = JSON.parse(response.body)
    expect(json).to include "errors" => "Authorization is not given."
  end

  it "should render error destroy for wrong micropost" do
    @other_user = create(:sterling)
    @micropost = create(:ants, user: @other_user)
    expect{
      delete micropost_path(@micropost), headers: authenticated_header(@user)
    }.to_not change(Micropost, :count)
    expect(response.status).to eq 403  
    json = JSON.parse(response.body)
    expect(json).to eq "error" => "micropost unauthorized"
  end
end
