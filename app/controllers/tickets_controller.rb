class TicketsController < ApplicationController

  before_action :set_event
  before_action :require_user

  def index
    @event = Event.find(params[:event_id])
    
    if params[:name]
      @ticket_type = TicketType.create(ticket_type_params)
      redirect_to event_tickets_path
    end
  end
  
  private

  def set_event
    @event = Event.find(params[:event_id])
    @ticket_type = @event.ticket_types.find(params[:id])
  end

  def ticket_type_params
      params.permit(:event_id, :name, :price, :max_quantity)
    end
end
