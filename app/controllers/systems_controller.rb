class SystemsController < ApplicationController

  def update
    @system = current_user.system
    @success = @system.update_attributes(params[:system])
  end
  
  def activate
    @system = current_user.system
    @system.active = true
    @system.save!
    redirect_to account_path unless request.xhr?
  end
  
  def pause
    @system = current_user.system
    @system.active = false
    @system.save!
    redirect_to account_path unless request.xhr?
  end
  
end