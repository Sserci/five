class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new
    @reservation.user = current_user
    event = Event.find(params[:event_id])
    @reservation.event = event
    if @reservation.save
      redirect_to event_reservation_path(event, @reservation)
    else
      redirect_to events_path
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:event_id])
    @reservation.destroy
    redirect_to event_path, status: :see_other
  end


end
