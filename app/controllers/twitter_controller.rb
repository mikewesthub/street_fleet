class TwitterController < ApplicationController
  def index
    @tweets = StreetTwitter.new.home_tweets
  end
end
