class AttendedEventsController < ApplicationController
  def new
    @attended_event = AttendedEvent.new
  end
  
  def create
    @attended_event = AttendedEvent.new(attendee_id: params[:user_id], event_id: params[(:event_id)])

    if @attended_event.save
      redirect_to events_index_path
    else
      render :new
    end
  end
end
