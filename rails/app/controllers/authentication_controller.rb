class AuthenticationController < ApplicationController  
  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      return render json: { token: token, exp: time.strftime("%Y-%m-%d %H:%M"), email: @user.email, admin: @user.admin }, status: :ok
    end
    render json: { error: 'unauthorized' }, status: :unauthorized
  end
end
