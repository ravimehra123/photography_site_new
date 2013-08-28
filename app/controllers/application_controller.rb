class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_pages_variable

 	def set_pages_variable ##access this variable at any page
    @pages = Page.all
  end

  # def authenticate_admin!
  #   redirect_to admin_login_path unless (current_user and current_user.admin == true)
  # end
end
