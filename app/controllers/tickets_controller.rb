class TicketsController < ApplicationController


  before_action :require_user

  def index
    @event = Event.find(params[:event_id])
  end
  
  def ticket_type_params
      params.permit(:event_id, :name, :price, :max_quantity)
    end
end
