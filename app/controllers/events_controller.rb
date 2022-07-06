class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @marker = {
      lat: @event.field.latitude,
      lng: @event.field.longitude
    }
    @reservation = Reservation.new
    @reservations = Reservation.where(event: @event)

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :nb_places, :date, :level, :field_id, :photo)
  end
end
