class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def user_logged_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
