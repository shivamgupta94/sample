class PagesController < ApplicationController
  def home
  	@rou = Rou.all
  	#rou = Rou.find(params[:rou_id])
  	@markers = Marker.all
  end
  
  def list
  	 @rou = Rou.all
  	#rou = Rou.find(params[:rou_id])
  	@markers = Marker.all
  end

  def about
  	
  end
end
