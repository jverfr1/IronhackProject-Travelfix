class EmbassiesController < ApplicationController
  def travel
  end
  def search
    @destination = params[:destination]
    @date1 = params[:from]
    @date2 = params[:to]
    hotel = Hotel.instance
    hotel.hotel_search(@destination,@date1,@date2)
    @hotels = hotel.hotels_results.paginate(page: params[:page], per_page: 5)
  end
  def show
    @embassy=Embassy.where('name=? and location_abroad=?', params[:to], params[:from])

    @embassy_info = Embassy.get_contact_info(@embassy[0].link)
    @src = Embassy.get_th_emb_img
    @visa_info = Embassy.read_pdf
  end
end

