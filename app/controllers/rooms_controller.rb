class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:id])
    @booking = Booking.new
  end
end
