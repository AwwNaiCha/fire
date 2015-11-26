class ProvincesController < ApplicationController

  def index
      @locations = Location.all
      @firelevel = FireLevel.all
      #respond_with(@locations)
      
      #@provinces = Province.all

      #respond_to do |format|
     #  format.json do  
      #   feature_collection = Province.to_feature_collection @provinces
     #     render json: RGeo::GeoJSON.encode(feature_collection)
     #   end                      
     #  format.html
     # end
      
      
  end
  

end