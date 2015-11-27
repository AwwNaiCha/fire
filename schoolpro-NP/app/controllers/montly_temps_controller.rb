class MontlyTempsController < ApplicationController
  before_action :set_montly_temp, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @montly_temps = MontlyTemp.all
    respond_with(@montly_temps)
  end

  def show
    respond_with(@montly_temp)
  end

  def new
    @montly_temp = MontlyTemp.new
    respond_with(@montly_temp)
  end

  def edit
  end

  def create
    @montly_temp = MontlyTemp.new(montly_temp_params)
    @montly_temp.save
    respond_with(@montly_temp)
  end

  def update
    @montly_temp.update(montly_temp_params)
    respond_with(@montly_temp)
  end

  def destroy
    @montly_temp.destroy
    respond_with(@montly_temp)
  end

  private
    def set_montly_temp
      @montly_temp = MontlyTemp.find(params[:id])
    end

    def montly_temp_params
      params.require(:montly_temp).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end
end
