class BuddyRequestsController < ApplicationController

  def create
    @sport = Sport.find(params[:sport_id])
    @buddy_request = BuddyRequest.new(buddy_request_params)
    @buddy_request.sport = @sport
    @buddy_request.user = current_user

    if @buddy_request.save
      redirect_to "#{sport_path(@sport, date: @buddy_request.date)}#anchor"
      authorize @buddy_request
    else
      render 'sports/show'
    end
  end

  def show
    @buddy_request = BuddyRequest.find(params[:id])
    authorize @buddy_request
    @users = User.joins(:buddy_requests)
                 .where(buddy_requests: { sport: @buddy_request.sport, date: @buddy_request.date })
                 .where.not(id: current_user.id)
                 .distinct
  end

  private

  def buddy_request_params
    params.require(:buddy_request).permit(:id, :date, :sport_id)
  end
end
