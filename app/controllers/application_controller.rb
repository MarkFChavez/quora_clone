class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_user
    User.find_by(id: session["user.id"])
  end
  helper_method :current_user

  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

  private

  def authenticate_user!
    redirect_to signin_path and return unless user_signed_in?
  end
end
