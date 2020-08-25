class BuddyRequestsController < ApplicationController
  def new
    @sport = Sport.find(params[:sport_id])
    @buddy_request = BuddyRequest.new
    # @sports = Sports.all
    authorize @buddy_request
  end

  def create
    @sport = Sport.find(params[:sport_id])
    @buddy_request = BuddyRequest.new
    @buddy_request.user = current_user
    @buddy_request.sport = @sport
  end

  private

  def buddy_request_params
    params.require(:buddy_request).permit(:start_time, :end_time, :sport_id)
  end
end
