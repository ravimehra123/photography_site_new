class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => 'sessions#failure')
    # render :text => '<pre>' + resource.to_yaml and return
    if resource.admin == true
      sign_in_and_redirect(resource_name, resource)
    end
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    if resourse.admin == true
      render :json => {
        :success => true,
        :redirect => admin_dashboards_path } and return
    else
      destroy
    end
  end

  def failure
    render :json => {:success => false, :errors => "Login failed."} and return
  end

  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        head :no_content
      end
    end
  end

end
