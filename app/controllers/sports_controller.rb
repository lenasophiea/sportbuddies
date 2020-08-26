class SportsController < ApplicationController

  def index
    @sports = policy_scope(Sport)
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
    # @sports = Sports.all
  end
end
