class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all 
        render json: sightings.to_json(:include=> {
            :bird=> {
                :only =>[:name, :species]
                }, 
            :location =>{
                :only =>[:latitude, :longitude]
                } 
            },
            :except => [:created_at, :updated_at]
        )
    end
    
    
    def show
        sighting = Sighting.find_by(id: params[:id])

        if sighting 
            render json: sighting, include: [:bird, :location], except: [:updated_at]
        else 
            render json: {message: 'Sighting not found'}
        end 
    end 
end
