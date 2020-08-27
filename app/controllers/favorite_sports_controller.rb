class FavoriteSportsController < ApplicationController

  def new
    @sport = Sport.find(params[:sport_id])
    @fav = FavoriteSport.new
  end

  def create
    @fav = FavoriteSport.new(fav_params)
    @sport = Sport.find(params[:sport_id])
    @fav.sport = @sport
    if @fav.save
      redirect_to sport_path(@sport)
    else
      render :new
    end
  end

  def destroy
    @fav = FavoriteSport.find(params[:id])
    @fav.destroy
    redirect_to sport_path(@fav.sport)
  end

  private

  def fav_params
    params.require(:fav).permit(:sport)
  end

end
