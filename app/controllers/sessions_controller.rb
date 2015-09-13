class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    redirect_to root_url if user_signed_in?
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session["user.id"] = user.id

    redirect_to root_url
  end

  def destroy
    session["user.id"] = nil
    redirect_to signin_url
  end
end
