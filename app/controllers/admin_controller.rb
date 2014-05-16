class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin_user!
  def index
  	@users = User.all
  end

  private
  def authenticate_admin_user!
  	redirect_to :root if !current_user || current_user.uid != "100001443255301"
  end
end
