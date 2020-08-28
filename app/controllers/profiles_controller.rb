class ProfilesController < ApplicationController
# before_action :user_params

  def show
    @user = User.find(params[:id])
    @buddy_request = BuddyRequest.find(params[:buddy_request_id])
        authorize @user
  end

  # private
  # def user_params
  #   params.require(:profile).permit(:id)
  # end

end
