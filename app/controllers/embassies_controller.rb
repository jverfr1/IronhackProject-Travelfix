class EmbassiesController < ApplicationController
  def travel

    respond_to do |format|
      format.html
    end
  end
  def search
    @destination = params[:destination]
    @date2 = params[:from]
    @date1 = params[:to]
    @hotels = Embassy.hotel_search(@destination, @date1, @date1)

  end
  def relocate
  end
end

