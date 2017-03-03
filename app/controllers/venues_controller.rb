class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def new
        @venues = Venue.new
    end

    def create
        @venue = venue.new(Venue_params)
        if @venue.save
        redirect_to venues_index_path
        end
    end

    private
        def Venue_params
        params.require(:Venue).permit(:name, :region_id, :full_address)
    end


end
