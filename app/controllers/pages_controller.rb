class PagesController < ApplicationController
  def home
    @hotels = Hotel.all
  end
end
