class SportsController < ApplicationController

  def index
    @sports = policy_scope(Sport)
  end

  def show
    @sport = Sport.find(params[:id])
    @buddy_request = BuddyRequest.new
    # @sports = Sports.all
  end
end
