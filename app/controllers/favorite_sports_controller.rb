class FavoriteSportsController < ApplicationController

  def new
    @sport = Sport.find(params[:sport_id])
    @fav = FavoriteSport.new
    authorize @fav
  end

  def create
    @fav = FavoriteSport.new
    authorize @fav
    @sport = Sport.find(params[:sport_id])
    @user = current_user
    @fav.sport = @sport
    @fav.user = @user
    if @fav.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @fav = FavoriteSport.find(params[:id])
    authorize @fav
    if @fav.destroy
      redirect_to root_path
    end
  end

  private

  def fav_params
    params.require(:favorite_sport).permit(:sport_id)
  end

end
