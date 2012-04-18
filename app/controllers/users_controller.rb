class UsersController < ApplicationController
  
  def show
  end
  
  def edit
  end
  
  def update
    @user = current_user
    @success = @user.update_attributes(params[:user])
  end
  
  def destroy
    current_user.system.destroy
    current_user.destroy
    sign_out!
    redirect_to root_path, notice: 'Your account and all pending tweets have been deleted. Thank you for using Day Tweeter!'
  end
end
