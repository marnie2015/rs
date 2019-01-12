class Admin::ApplicationController < ActionController::Base
  before_action :set_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include AdminHelper
  layout 'admin_application'
  protect_from_forgery with: :exception
  # WillPaginate.per_page = 100

  def check_access
    if session[:user] == nil
      render file: 'public/404.html'
    end
  end

  def set_user
    UserInfo.current_user = session[:user]
  end
end
