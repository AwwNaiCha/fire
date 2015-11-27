class MonthlyFireLevelsController < ApplicationController
  before_action :set_monthly_fire_level, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @monthly_fire_levels = MonthlyFireLevel.all
    respond_with(@monthly_fire_levels)
  end

  def show
    respond_with(@monthly_fire_level)
  end

  def new
    @monthly_fire_level = MonthlyFireLevel.new
    respond_with(@monthly_fire_level)
  end

  def edit
  end

  def create
    @monthly_fire_level = MonthlyFireLevel.new(monthly_fire_level_params)
    @monthly_fire_level.save
    respond_with(@monthly_fire_level)
  end

  def update
    @monthly_fire_level.update(monthly_fire_level_params)
    respond_with(@monthly_fire_level)
  end

  def destroy
    @monthly_fire_level.destroy
    respond_with(@monthly_fire_level)
  end

  private
    def set_monthly_fire_level
      @monthly_fire_level = MonthlyFireLevel.find(params[:id])
    end

    def monthly_fire_level_params
      params.require(:monthly_fire_level).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end
end
