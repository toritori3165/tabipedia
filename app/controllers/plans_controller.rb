class PlansController < ApplicationController
  before_action :set_trip

  def index
    @plans = @trip.plans
  end


  def new
    @trip = Trip.find(params[:trip_id])
    @plan = Plan.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 
  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to trip_plan_path(@trip.id)
    else
      render 'edit'
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
    params.require(:plan).permit(:plan_title, :content ).merge(trip_id: (params[:trip_id]))
  end

  def set_trip
  @trip = Trip.find(params[:trip_id])
  end

end
