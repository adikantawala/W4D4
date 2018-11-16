class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user)
    else
      render json: "bad"
    end
  end

  def show
    @user = current_user #User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
