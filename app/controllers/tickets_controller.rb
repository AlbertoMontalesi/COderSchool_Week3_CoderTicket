class TicketsController < ApplicationController

  before_action :set_event
  before_action :require_user

  def index
    @ticket_types = @event.ticket_types
  end

  def create
    @ticket_types = @event.ticket_types.build(ticket_type_params)
    @order.total_price_calculation
    @order.quantity_remain

    if @ticket_type.save
      flash[:success] ='ticket created successfully'
      redirect_to event_tickets_path
    else
      flash[:error] = 'error'
      end
  end
  private

   def set_event
    @event = Event.find(params[:event_id])
    
  end

  def ticket_type_params
      params.require(:ticket_type).permit(:event_id, :name, :price, :max_quantity)
    end
end
