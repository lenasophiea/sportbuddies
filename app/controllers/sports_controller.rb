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
  end

  def show
    @sport = Sport.find(params[:id])
  end
end
