class RelationshipsController < ApplicationController
  before_action :authorize_request
  before_action :set_user, only: :destroy

  def create
    user = User.find_by(id: params[:followed_id])
    @follow = @current_user.active_relationships.build(relationship_params)
    if @follow.save
      render json: @follow, status: :ok
    else
      render json: { error: @follow.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = Relationship.find(params[:id]).followed
    @current_user.unfollow(user)
    render json: { success: "user unfollowed" }, status: :ok
  end
  
  private
  
  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
  
  def set_user
    @user = User.find_by(id: params[:id])
  end
end
