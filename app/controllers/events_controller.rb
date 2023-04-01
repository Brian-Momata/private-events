class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to user_events_url(current_user)
    else
      render :new
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:location, :date)
  end
end
