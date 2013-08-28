class Admin::DashboardsController < ApplicationController
	before_filter :authenticate_user!
	before_filter do
		if  (current_user and current_user.admin == true)
		else
			flash[:notice]="Invalid Login Credentials"
			session.clear
			redirect_to root_url
		end
	end
	layout "admin"
	def index
	end
end
