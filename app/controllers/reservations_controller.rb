class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new
    @reservation.user = current_user
    @reservation.event = Event.find(params[:event_id])
    if @reservation.save
      redirect_to event_path(@reservation.event)
    else
      redirect_to events_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:event_id])
    @reservation.destroy
    redirect_to event_path, status: :see_other
  end


end
