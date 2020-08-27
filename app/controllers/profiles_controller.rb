class ProfilesController < ApplicationController
# before_action :user_params

  def show
    @user = User.find(params[:id])
        authorize @user
  end

  # private
  # def user_params
  #   params.require(:profile).permit(:id)
  # end

end
