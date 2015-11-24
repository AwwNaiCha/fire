class VisitornumbersController < ApplicationController
  before_action :set_visitornumber, only: [:show, :edit, :update, :destroy]
  before_action :set_campernumber, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @visitornumbers = Visitornumber.all
    respond_with(@visitornumbers)
  end

  def show
    respond_with(@visitornumber, @campernumber)
  end

  def new
    @visitornumber = Visitornumber.new
    respond_with(@visitornumber)
  end

  def edit
  end

  def create
    @visitornumber = Visitornumber.new(visitornumber_params)
    @visitornumber.save
    respond_with(@visitornumber)
  end

  def update
    @visitornumber.update(visitornumber_params)
    respond_with(@visitornumber)
  end

  def destroy
    @visitornumber.destroy
    respond_with(@visitornumber)
  end

  private
    def set_visitornumber
      @visitornumber = Visitornumber.find(params[:id])
    end

    def visitornumber_params
      params.require(:visitornumber).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

    def set_campernumber
      @campernumber = Campernumber.find(params[:id])
    end

    def campernumber_params
      params.require(:campernumber).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end
end
