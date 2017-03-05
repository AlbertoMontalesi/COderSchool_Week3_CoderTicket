class EventsController < ApplicationController
before_action :require_user, only: [:create, :new, :edit,:publish]

  def index #show only the events in the future 
      @events = Event.upcoming
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.upcoming.order("created_at DESC")
    end

  end

  def new
    @event = current_user.events.build
  end

  def create
    @venues = Venue.all
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] =  "Event created!"
      redirect_to edit_event_path(:id => @event.id)
    else
      flash[:error] = 'An error occured during the creation'
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
    @venues = Venue.all
  end

  def update
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    
  end

   def show_mine #shows the event created by the current user
    @events = current_user.events
  end

  def destroy
    Event.find(params[:id]).destroy
      render show_mine_events_path
      flash.now[:success] = "Event successfully deleted"
  end



  def publish #must publish before an event is visible
    @event = Event.find(params[:id])
      if @event.enough_ticket_types?
        @event = Event.find(params[:id])
        @event.update_attributes(:is_published => true)
          redirect_to events_path
      else
        flash.now[:error] = "Please select at least one ticket type"
        render 'edit'
      end
  end


private

def event_params
  params.require(:event).permit(:name, :starts_at,:ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
end

end


