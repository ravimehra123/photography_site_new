class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :set_pages_variable
  # before_filter :auth_admin

  def auth_admin
  	unless current_user
  		redirect_to new_session_path
  	end
  end

 	def set_pages_variable ##access this variable at any page
    @pages = Page.all
  end

	private
	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
