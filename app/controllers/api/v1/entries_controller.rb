class Api::V1::EntriesController < ApplicationController
  before_action :get_entry, only: [:show, :update, :destroy]

  def index
    @entries = Entry.all
    render json: @entries
  end

  def show
    render json: @entry
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @entry
    @entry.destroy
  end

  private

  def entry_params
    params.permit(:wager, :payout, :attending, :user_id, :plan_id)
  end

  def get_entry
    @entry = Entry.find(params[:id])
  end
end
