class SportsController < ApplicationController

  def index

    @sports = policy_scope(Sport)

    @sports_selection = Sport.pluck(:name).sort

    if params[:query_sport].present?
      @sports = Sport.search_by_sport_filter(params[:query_sport])
    elsif params[:query_address].present?
      @sports = Sport.search_by_sport_filter(params[:query_address])
    else
      @sports = Sport.all
    end

    @sports_geo = @sports.geocoded # returns flats with coordinates

    @markers = @sports_geo.map do |sport|
      {
        lat: sport.latitude,
        lng: sport.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { sport: sport })
      }
    end
  end

  def show
    @sport = Sport.find(params[:id])
    @buddy_request = BuddyRequest.new
    authorize @sport
    # @sports = Sports.all
  end

  def favorite
     type = params[:type]
    if type == "favorite"
      current_user.favorites << @sport
      redirect_to :back, notice: 'You favorited #{@sport.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@sport)
      redirect_to :back, notice: 'Unfavorited #{@sport.name}'

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


end
