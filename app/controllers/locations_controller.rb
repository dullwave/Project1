class LocationsController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(loc_params)
    if @location.save
      redirect_to new_location_path
    else
      render :new
    end
  end

  private

  def loc_params
    params.require(:location).permit(:id, :address, :city, :state, :zip)
  end
end

# need to figure out:
#   using geocoder to translate address into lat + long
#   plug lat + long vals into method that rounds them off and +/- .3 lat/long, inputs that value for minx/miny/maxx/maxy
#   plugs those vals into urbarama GET api: http://www.urbarama.com/api/project?sort=popular&offset=0&count=20&minx=-180&miny=-90&maxx=180&maxy=90&size=small&format=json
#   return these projects, show them in map using gmaps4rails gem
