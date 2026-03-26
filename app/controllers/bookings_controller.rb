class BookingsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.room = @room

    if @booking.save
      redirect_to hotel_room_path(@hotel, @room), notice: "Réservation confirmée !"
    else
      redirect_to hotel_room_path(@hotel, @room), alert: "Erreur lors de la réservation."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
