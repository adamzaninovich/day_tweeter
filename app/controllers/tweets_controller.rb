class TweetsController < ApplicationController
  
  def disable
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      if @tweet.disable!
        redirect_to home_path
      else
        redirect_to home_path, alert: 'Unable to disable tweet'
      end
    else
      redirect_to home_path, alert: 'That tweet does not exist'
    end
  end
  
  def enable
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      if @tweet.enable!
        redirect_to home_path
      else
        redirect_to home_path, alert: 'Unable to enable tweet'
      end
    else
      redirect_to home_path, alert: 'That tweet does not exist'
    end
  end
  
  def create
    @tweet = current_user.tweets.build(params[:tweet])
    @tweet.active = true
    @tweet.published = false
    # if it's before the end time for the day
    @tweet.date = Date.today
    # else if it's after, Date.tomorrow
    
    if @tweet.save!
      # schedule tweets here
      redirect_to home_path, notice: 'Tweet was successfully added'
    else
      render action: :new
    end
  end
  
  def publish
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      @tweet.update_attribute(:pending, true)
      Resque.enqueue_in 15.seconds, TweetPublisher, @tweet.id
      link = ActionController::Base.helpers.link_to('Cancel', unpublish_tweet_path)
      redirect_to home_path, notice: "Tweet will be published in <span class='countdown'>15</span> seconds (#{link})"
    else
      redirect_to home_path, alert: 'Tweet does not exist'
    end
  end
  
  def unpublish
    @tweet = current_user.tweets.pending.where(id: params[:id]).first
    if @tweet.present?
      Resque.remove_delayed(TweetPublisher, @tweet.id)
      @tweet.update_attribute(:pending, false)
      redirect_to home_path, notice: "Publishing cancelled"
    else
      redirect_to home_path, alert: 'Tweet already published and cannot be cancelled'
    end
  end
  
  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])
    
    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to home_path }
        format.json { head :no_content }
      else
        format.html { redirect_to home_path, alert:'Error saving tweet' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    
    # reschedule tweets here
    
    @tweet.destroy
    redirect_to home_path
  end
end
