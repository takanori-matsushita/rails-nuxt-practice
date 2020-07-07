class MicropostsController < ApplicationController
before_action :authorize_request, only: [:create, :destroy]
before_action :correct_user , only: :destroy

  def create
    @micropost = @current_user.microposts.build(micropost_params)
    if @micropost.save
      render json: @micropost, status: :ok
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    render json: { success: "micropost deleted" }, status: :ok
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = @current_user.microposts.find_by(id: params[:id])
    return render json: { error: "micropost unauthorized" }, status: :forbidden if @micropost.nil?
  end
end
