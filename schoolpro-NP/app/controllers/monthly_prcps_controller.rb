class MonthlyPrcpsController < ApplicationController
  before_action :set_monthly_prcp, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @monthly_prcps = MonthlyPrcp.all
    respond_with(@monthly_prcps)
  end

  def show
    respond_with(@monthly_prcp)
  end

  def new
    @monthly_prcp = MonthlyPrcp.new
    respond_with(@monthly_prcp)
  end

  def edit
  end

  def create
    @monthly_prcp = MonthlyPrcp.new(monthly_prcp_params)
    @monthly_prcp.save
    respond_with(@monthly_prcp)
  end

  def update
    @monthly_prcp.update(monthly_prcp_params)
    respond_with(@monthly_prcp)
  end

  def destroy
    @monthly_prcp.destroy
    respond_with(@monthly_prcp)
  end

  private
    def set_monthly_prcp
      @monthly_prcp = MonthlyPrcp.find(params[:id])
    end

    def monthly_prcp_params
      params.require(:monthly_prcp).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end
end
