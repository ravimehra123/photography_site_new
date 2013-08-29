class Admin::PagesController < ApplicationController
# before_filter :authenticate_user!
#   before_filter do
#     if  (current_user and current_user.admin == true)
#     else
#       flash[:notice]="Invalid Login Credentials"
#       session.clear
#       redirect_to root_url
#     end
#   end
layout "admin"
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to [:admin, @page], :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to [:admin, @page], :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_url, :notice => "Successfully destroyed page."
  end
end
