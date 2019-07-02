class Api::V1::PlansController < ApplicationController
  before_action :get_plan, only: [:show, :update, :destroy]

  def index
    @plans = Plan.all
    render json: @plans
  end

  def show
    render json: @plan
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      render json: @plan, status: :created
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @plan
    @plan.destroy
  end

  private

  def plan_params
    params.permit(:creator_id, :name, :end, :cost)
  end

  def get_plan
    @plan = Plan.find(params[:id])
  end
end
