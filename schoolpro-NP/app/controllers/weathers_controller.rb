class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @weathers = Weather.all
    respond_with(@weathers)
  end

  def show
    respond_with(@weather)
  end

  def new
    @weather = Weather.new
    respond_with(@weather)
  end

  def edit
  end

  def create
    @weather = Weather.new(weather_params)
    @weather.save
    respond_with(@weather)
  end

  def update
    @weather.update(weather_params)
    respond_with(@weather)
  end

  def destroy
    @weather.destroy
    respond_with(@weather)
  end

  private
    def set_weather
      @weather = Weather.find(params[:id])
    end

    def weather_params
      params.require(:weather).permit(:park_name, :date, :temp, :precip, :wind, :humidity)
    end
end
