class TicketsController < ApplicationController


before_action :require_user

  def new
    @event = Event.find(params[:event_id])
  end
end
