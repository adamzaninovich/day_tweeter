class TweetsController < ApplicationController


  def create
    @tweet = current_user.tweets.build(params[:tweet])
    @tweet.active = true
    @tweet.published = false
    # if it's before the end time for the day
    @tweet.date = Date.today
    # else if it's after, Date.tomorrow
    
    if @tweet.save!
      redirect_to account_path, notice: 'Tweet was successfully created.'
    else
      render action: :new
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
