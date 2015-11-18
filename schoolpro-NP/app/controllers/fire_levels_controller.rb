class FireLevelsController < ApplicationController
  before_action :set_fire_level, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fire_levels = FireLevel.all
    respond_with(@fire_levels)
  end

  def show
    respond_with(@fire_level)
  end

  def new
    @fire_level = FireLevel.new
    respond_with(@fire_level)
  end

  def edit
  end

  def create
    @fire_level = FireLevel.new(fire_level_params)
    @fire_level.save
    respond_with(@fire_level)
  end

  def update
    @fire_level.update(fire_level_params)
    respond_with(@fire_level)
  end

  def destroy
    @fire_level.destroy
    respond_with(@fire_level)
  end

  private
    def set_fire_level
      @fire_level = FireLevel.find(params[:id])
    end

    def fire_level_params
      params.require(:fire_level).permit(:park_name, :date, :level)
    end
end
