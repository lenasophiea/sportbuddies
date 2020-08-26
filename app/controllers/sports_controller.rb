class SportsController < ApplicationController

  def index
    @sports = policy_scope(Sport)
    if params[:query_sport].present?
      @sports = Sport.search_by_sport_filter(params[:query_sport])
    elsif params[:query_address].present?
      @sports = Sport.search_by_sport_filter(params[:query_address])
    else
      @sports = Sport.all
    end

    @sports_geo = Flat.geocoded # returns flats with coordinates

    @markers = @sports_geo.map do |sport|
      {
        lat: sport.latitude,
        lng: sport.longitude
      }
  end

  def show
    @sport = Sport.find(params[:id])
    @buddy_request = BuddyRequest.new
    authorize @sport
    # @sports = Sports.all
  end
end
