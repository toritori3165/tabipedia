class PlansController < ApplicationController
  def new
    @plan = Plan.new(params[:trip_id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:plan_title, :content ).merge(trip_id: (params[:trip_id]))
  end
end
