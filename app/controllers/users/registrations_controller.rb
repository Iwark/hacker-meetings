class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
 
  def create
    super
  end

  def edit
    super
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end
    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      # sign_in @user, :bypass => true
      redirect_to :root
    else
      render "edit"
    end
  end

  protected
  def authenticate_user!(options={})
    if !user_signed_in?
      session[:user_return_to] = env['PATH_INFO']
      redirect_to user_omniauth_authorize_path(:facebook)
    else
      super(options)
    end
  end

end