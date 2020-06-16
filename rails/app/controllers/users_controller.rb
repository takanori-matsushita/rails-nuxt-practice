class UsersController < ApplicationController
  def show
    @user = User.secure.find_by(id: params[:id])
    return render json: { user: @user, gravatar_image: gravatar_for(user) }, status: :ok if @user
    render json: { error: 'user not found' }, status: :not_found
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def gravatar_for(user, size: 80)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end
end
