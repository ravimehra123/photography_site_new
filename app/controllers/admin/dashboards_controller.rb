class Admin::DashboardsController < ApplicationController
	before_filter :auth_admin
	
	layout "admin"
	def index
	end
end
