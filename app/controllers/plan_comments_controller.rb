class PlanCommentsController < ApplicationController
  def create
    plan_comment = PlanComment.create(plan_comment_params)
    redirect_to "/plans/#{plan_comment.plan.id}"
  end

  private
  def plan_comment_params
    params.require(:plan_comment).permit(:text).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end
end
