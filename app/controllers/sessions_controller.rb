class SessionsController < ApplicationController
  
  before_filter :require_user!, only: [:destroy]
  
  def create # do sad path
    @user = User.where(twitter_id: twitter_id).first_or_initialize(twitter_attributes)
    if @user.new_record?
      @user.save!
      next_page = account_settings_path
      notice = "Welcome to Day Tweeter! Please update your settings."
    else
      next_page = account_path
      notice = "Signed in as @#{@user.username}. Welcome back!"
    end
    sign_in! @user
    redirect_to next_page, notice: notice
  end
  
  def denied
    redirect_to root_path, alert: 'You were not logged in.'
  end
  
  def destroy
    sign_out!
    redirect_to root_path
  end
  
  protected
  
  def twitter_attributes
    {
      username:     auth_hash[:info][:nickname],
      name:         auth_hash[:info][:name],
      image:        auth_hash[:info][:image].gsub(/_normal\./,'_reasonably_small.'),
      auth_token:   auth_hash[:credentials][:token],
      auth_secret:  auth_hash[:credentials][:secret]
    }
  end
  
  def twitter_id
    auth_hash[:uid]
  end

  def auth_hash
    @auth_hash ||= request.env['omniauth.auth']
  end  
  
end
