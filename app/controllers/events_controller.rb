class EventsController < ApplicationController
before_action :require_user, only: [:create, :new]

  def index #show only the events in the future 
      @upcoming_events = Event.where("starts_at >= ?", Time.now)
      @past_events = Event.where("starts_at < ?", Time.now)

    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order("created_at DESC")
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
    @event.destroy
      render show_mine_path
      flash.now[:success] = "Event successfully deleted"
  end



  def publish #must publish before an event is visible
    @event = Event.find(params[:id])
    if @event.update_attributes(:is_published => true)
      redirect_to events_path
    end
  end


private

def event_params
  params.require(:event).permit(:name, :starts_at,:ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
end

end


