class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @parks = Park.all
    respond_with(@parks)
  end

  def show
    respond_with(@park)
  end

  def new
    @park = Park.new
    respond_with(@park)
  end

  def edit
  end

  def create
    @park = Park.new(park_params)
    @park.save
    respond_with(@park)
  end

  def update
    @park.update(park_params)
    respond_with(@park)
  end

  def destroy
    @park.destroy
    respond_with(@park)
  end

  private
    def set_park
      @park = Park.find(params[:id])
    end

    def park_params
      params.require(:park).permit(:park_name, :state)
    end
end
