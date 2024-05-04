class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_trip, only: [:edit, :update]


  def index
    @trips = if Trip.all.length.positive?
               Trip.includes(:user).order('created_at DESC')
             else
               [Trip.default]
             end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    # @trip.users.each do |user|
      unless @trip.user.valid?
        puts "Invalid User: #{user.errors.full_messages.to_sentence}"
      end
    # end
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
    @trips = Trip.search(params[:keyword], params[:keyword]).order("created_at DESC")
  end 
  
  private
  def trip_params
    params.require(:trip).permit(:trip_title, :place, :start_date, :end_date, :address, { images: [] }).merge(user_id: current_user.id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
