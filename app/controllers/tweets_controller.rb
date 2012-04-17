class TweetsController < ApplicationController
  
  def disable
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      if @tweet.disable!
        redirect_to account_path
      else
        redirect_to account_path, alert: 'Unable to disable tweet'
      end
    else
      redirect_to account_path, alert: 'That tweet does not exist'
    end
  end
  
  def enable
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      if @tweet.enable!
        redirect_to account_path
      else
        redirect_to account_path, alert: 'Unable to enable tweet'
      end
    else
      redirect_to account_path, alert: 'That tweet does not exist'
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
      redirect_to account_path, notice: 'Tweet was successfully added'
    else
      render action: :new
    end
  end
  
  def publish
    @tweet = current_user.tweets.unpublished.where(id: params[:id]).first
    if @tweet.present?
      if @tweet.publish!
        redirect_to account_path, notice: 'Tweet was published'
      else
        redirect_to account_path, alert: 'Unable to publish tweet'
      end
    else
      redirect_to account_path, alert: 'That tweet does not exist'
    end
  end
  
  # PUT /tweets/1
  # PUT /tweets/1.json
  # def update
  #   @tweet = Tweet.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @tweet.update_attributes(params[:tweet])
  #       format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @tweet.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to account_path
  end
end
