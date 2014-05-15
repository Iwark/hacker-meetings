class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!(options={})
    session[:user_return_to] = env['PATH_INFO']
    redirect_to user_omniauth_authorize_path(:facebook) unless user_signed_in?
    super(options)
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:nickname, :gender, :belonging]
  end
end
