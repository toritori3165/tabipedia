class TripCommentsController < ApplicationController
  def create
    trip_comment = TripComment.create(trip_comment_params)
    redirect_to "/trips/#{trip_comment.trip.id}"
  end

  private
  def trip_comment_params
    params.require(:trip_comment).permit(:text).merge(user_id: current_user.id, trip_id: params[:trip_id])
  end
end
