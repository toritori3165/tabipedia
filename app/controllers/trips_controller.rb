class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:trip_title, :place, :start_date, :end_date, user_ids: [])
  end
end
