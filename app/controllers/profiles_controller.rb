class ProfilesController < ApplicationController
# before_action :user_params

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @buddy_request = BuddyRequest.find(params[:buddy_request_id])

    # @user.buddy_request = @buddy_request

    authorize @user
  end

  # private
  # def user_params
  #   params.require(:profile).permit(:id)
  # end

end
