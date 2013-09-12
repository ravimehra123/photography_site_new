class SessionsController < ApplicationController
  def new
  	#render :text=>'<pre>' + params.to_yaml and return
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to admin_dashboards_path, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end