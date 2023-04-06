class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:edit, :update, :show, :destory]

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

  def edit
  end
  
  def update
      if @event.update(event_params)
        flash[:success] = "Event was successfully updated"
        redirect_to action: 'show'
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def show
  end

  private
  
  def event_params
    params.require(:event).permit(:location, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
