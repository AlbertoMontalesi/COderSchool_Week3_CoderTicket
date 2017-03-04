class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end


    def new
        @venues = Venue.new
    end

    def create
        @venue = Venue.new venue_params
        if @venue.save!
            redirect_to venues_path
        else
            flash.now[:failure] = 'failed to create venue'
        end
    end

    private
        def venue_params
        params.require(:venue).permit(:name, :region_id, :full_address)
    end


end
