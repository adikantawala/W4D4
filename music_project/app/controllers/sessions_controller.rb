class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by_credentials(params[:user][:email],params[:user][:password])
  # byebug
  if user
    login!(user)
    redirect_to user_url(user)
  else
    render json: "Not good"
  end
end

def destroy
  logout!
  redirect_to new_session_url
end

end
