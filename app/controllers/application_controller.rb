class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_tweets

  def load_tweets
    @street_tweets = StreetTwitter.new
    @street_tweets.client.home_timeline
  end
end
