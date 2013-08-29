class Admin::AlbumsController < ApplicationController
  # before_filter :user_role_auth
  # before_filter :authenticate_user!
  # before_filter do
  #   if  (current_user and current_user.admin == true)
  #   else
  #     flash[:notice]="Invalid Login Credentials"
  #     session.clear
  #     redirect_to root_url
  #   end
  # end
	layout "admin"
	def index
    @albums = Album.order("order_no ASC")
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    @album.upload_date = Time.now
    @album.order_no = Album.last.blank? ? "0" : Album.last.id
		if @album.save
      redirect_to [:admin,@album], :notice => "Successfully created album."
    else
      render :action => 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to [:admin,@album], :notice  => "Successfully updated album."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admin_albums_url, :notice => "Successfully destroyed album."
  end
	
  def change_position
    @album_1 = Album.find(params[:id])
    @album_2 = Album.find(params[:change_id])
    if !@album_1.blank? && !@album_2.blank?
      order_no_1 = @album_1.order_no
      order_no_2 = @album_2.order_no
      @album_1.order_no = order_no_2
      @album_2.order_no = order_no_1
      @album_1.save
      @album_2.save
    end
    # redirect_to :action => :index
    redirect_to admin_albums_url
  end

	def show_images
		@album = Album.find(params[:id])
		@album_images = @album.album_images.order("order_no ASC")
	end
	
	def update_caption
		
		# if !params[:capiton].nil?
			params[:caption].each do|caption|
				if !caption.last.blank?
					@album_image = AlbumImage.find(caption.first)
					# render :text => "<pre>"+ @album_image.to_yaml and return
					@album_image.update_attributes(:caption => caption.last)					
				end
				
			end
		# end
		# redirect_to :action=>'index'
    redirect_to admin_albums_url
	end

  def image_album
   @albums = Album.order("order_no ASC")
  end
end
