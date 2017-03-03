class EventsController < ApplicationController

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
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] =  "Event created!"
      redirect_to event_path #to change
    else
      
      render new_event_path
    end
  end


  def show
    @event = Event.find(params[:id])
  end



private

def event_params
  params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
end

end


