class SightingsController < ApplicationController
# Why not an index?
def index
  sightings = Sighting.all
  render json: sightings.to_json(include: [:bird, :location], except: [:updated_at, :created_at])
end

def show
  sighting = Sighting.find_by(id: params[:id])
  if sighting
    render json: sighting, include: [:bird, :location], except: [:updated_at, :created_at]
  else
    render json: { message: 'No sighting found with that id' }
  end
end

end
