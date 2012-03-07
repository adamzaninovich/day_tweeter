class UsersController < ApplicationController
  def show
  end
  
  def edit
  end
  
  def update
    if current_user.update_attributes(params[:user])
      redirect_to user_path, notice: 'Your settings were saved.'
    else
      render action :edit
    end
  end
  
  def destroy
    current_user.destroy
    sign_out!
    redirect_to root_path, notice: 'Your account and all pending tweets have been deleted. Thank you for using Day Tweeter!'
  end
end
