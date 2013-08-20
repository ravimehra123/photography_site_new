class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_pages_variable

 	def set_pages_variable ##access this variable at any page
    @pages = Page.all
  end
end
