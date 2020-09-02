class SportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def index

    @sports = policy_scope(Sport)

    @sports_selection = Sport.pluck(:name).sort

    if params[:query_sport].present?
      @sports = Sport.search_by_sport_filter(params[:query_sport])
    elsif params[:query_address].present?
      @sports = Sport.near(params[:query_address],3)
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
    @date = params[:date]
    @buddy_request = BuddyRequest.new
    authorize @sport

    # @buddy_request = BuddyRequest.find(params[:id])
    authorize @buddy_request
    @buddy_requests = BuddyRequest.where(buddy_requests: { sport: @sport, date: @date })
                                 .where.not(user_id: current_user.id)
                                 .distinct
    # @users = User.joins(:buddy_requests)
    @sports = Sport.all
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

  # for javascript autocomplete feature
  def home
  end
end

