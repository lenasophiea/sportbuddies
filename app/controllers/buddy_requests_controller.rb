class BuddyRequestsController < ApplicationController

  def create
    @sport = Sport.find(params[:sport_id])
    @buddy_request = BuddyRequest.new
    @buddy_request.user = current_user
    @buddy_request.sport = @sport
    if @buddy_request.save
      redirect_to buddy_request_path(@buddy_request)
    else
      render 'sports/show'
    end
  end

  private

  def buddy_request_params
    params.require(:buddy_request).permit(:start_time, :end_time, :sport_id)
  end
end
