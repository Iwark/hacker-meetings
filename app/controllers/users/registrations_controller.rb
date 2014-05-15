class Users::RegistrationsController < Devise::RegistrationsController
 
  def new
    super
  end
 
  def create
    super
  end

  def edit
  	render 'edit'
  end

  def update
  	super
  end
 
end