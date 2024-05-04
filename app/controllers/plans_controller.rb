class PlansController < ApplicationController
  before_action :set_trip

  def index
    @plans = @trip.plans
    @trip_comment = TripComment.new
    @trip_comments = @trip.trip_comments.includes(:user).order("created_at DESC")
  end


  def new
    @trip = Trip.find(params[:trip_id])
    @plan = Plan.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to trip_plan_path(@trip.id, @plan.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

 
  def show
    @plan = Plan.find(params[:id])
    @plan_comment = PlanComment.new
    @plan_comments = @plan.plan_comments.includes(:user).order("created_at DESC")
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to trip_plan_path(@trip.id, @plan.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if plan.destroy
    redirect_to root_path
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:days_id, :plan_title, :content, { images: [] }).merge(trip_id: (params[:trip_id]))
  end

  def set_trip
    @trip = Trip.find_with_default(params[:trip_id])
  end

end
