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

  def show
    @event = Event.find(params[:id])
  end
end
