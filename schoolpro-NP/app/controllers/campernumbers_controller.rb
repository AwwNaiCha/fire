class CampernumbersController < ApplicationController
  before_action :set_campernumber, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @campernumbers = Campernumber.all
    respond_with(@campernumbers)
  end

  def show
    respond_with(@campernumber)
  end

  def new
    @campernumber = Campernumber.new
    respond_with(@campernumber)
  end

  def edit
  end

  def create
    @campernumber = Campernumber.new(campernumber_params)
    @campernumber.save
    respond_with(@campernumber)
  end

  def update
    @campernumber.update(campernumber_params)
    respond_with(@campernumber)
  end

  def destroy
    @campernumber.destroy
    respond_with(@campernumber)
  end

  private
    def set_campernumber
      @campernumber = Campernumber.find(params[:id])
    end

    def campernumber_params
      params.require(:campernumber).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end
end
