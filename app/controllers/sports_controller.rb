class SportsController < ApplicationController

  def index
    @sports = policy_scope(Sport)
  end

  def show
    @sport = Sport.find(params[:id])
    @buddy_request = BuddyRequest.new
    authorize @sport
    # @sports = Sports.all
  end
end
