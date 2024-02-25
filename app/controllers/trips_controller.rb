class TripsController < ApplicationController
  before_action :set_users
  before_action :set_trip, only: [:edit, :update]


  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to new_trip_plan_path(trip_id: @trip.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    redirect_to trip_plans_path(params[:id])
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_plans_path(@trip.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    if trip.destroy
    redirect_to root_path
    end
  end

  def search
    @trips = Trip.search(params[:keyword])
  end 
  
  private
  def set_users
    @users = User.all
  end

  def trip_params
    params.require(:trip).permit(:trip_title, :place, :start_date, :end_date, user_ids: [], images: [])
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
