class Admin::AlbumImagesController < ApplicationController
  # before_filter :user_role_auth
 # before_filter :authenticate_user!
 #  before_filter do
 #    if  (current_user and current_user.admin == true)
 #    else
 #      flash[:notice]="Invalid Login Credentials"
 #      session.clear
 #      redirect_to root_url
 #    end
 #  end
  layout "admin"
  def index
    @album_images = AlbumImage.all
  end

  def show
    @album_image = AlbumImage.find(params[:id])
  end

  def new
    @album_image = AlbumImage.new
  end

  def create
    @album_image = AlbumImage.new(params[:album_image])
    if @album_image.save
      redirect_to [:admin,@album_image], :notice => "Successfully created album image."
    else
      render :action => 'new'
    end
  end

  def edit
    @album_image = AlbumImage.find(params[:id])
  end

  def update
    @album_image = AlbumImage.find(params[:id])
    if @album_image.update_attributes(params[:album_image])
      redirect_to [:admin,@album_image], :notice  => "Successfully updated album image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @album_image = AlbumImage.find(params[:id])
		@album_id = @album_image.album_id
    @album_image.destroy
    redirect_to :controller => "admin/albums",:action => "show_images",:id =>@album_id , :notice => "Successfully destroyed album image."
    # redirect_to album_images_url, :notice => "Successfully destroyed album image."
  end

  def change_position
    @album_image_1 = AlbumImage.find(params[:id])
    @album_image_2 = AlbumImage.find(params[:change_id])
    if !@album_image_1.blank? && !@album_image_2.blank?
      order_no_1 = @album_image_1.order_no
      order_no_2 = @album_image_2.order_no
      @album_image_1.order_no = order_no_2
      @album_image_2.order_no = order_no_1
      @album_image_1.save
      @album_image_2.save
    end
    redirect_to :controller => "admin/albums",:action => "show_images",:id =>@album_image_1.album_id , :notice => "Successfully updated"
  end

  
	def new_upload
		# @albumimages = AlbumImage.create(:album_id => 1)
		if !params[:files].blank?
			#render :text=>"<pre>"+ params.to_yaml and return true
			params[:files].each do|f|		
				@albumimages = AlbumImage.new(:album_image => f,:album_id=>params[:id], :status=>'1', :upload_date => Time.now)		
				@albumimages.order_no = AlbumImage.last.blank? ? "0" : AlbumImage.last.id
        @albumimages.save				
			end
			# render :json => [ActiveSupport::JSON.encode({ :size => @albumimages.album_image_file_size })]
		end
		
		
		# render :layout=>false and return
	end
end
