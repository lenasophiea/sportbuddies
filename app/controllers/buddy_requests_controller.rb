class BuddyRequestsController < ApplicationController

  def create
    @sport = Sport.find(params[:sport_id])
    @buddy_request = BuddyRequest.new
    @buddy_request.user = current_user
    @buddy_request.sport = @sport
    if @buddy_request.save
      redirect_to buddy_request_path(@buddy_request)
      authorize @buddy_request
    else
      render 'sports/show'
    end
  end

  def show
   authorize BuddyRequest.new
   end

  private

  def buddy_request_params
    params.require(:buddy_request).permit(:date, :sport_id)
  end
end
