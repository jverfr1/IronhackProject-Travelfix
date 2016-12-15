class EmbassiesController < ApplicationController
  def travel

    respond_to do |format|
      format.html
    end
  end
  def search
    @destination = params[:destination]
    @date1 = params[:from]
    @date2 = params[:to]
    # unless Embassy.check_date(@date1)
    #   redirect_to '/travel'
    # end
    @hotels = Hotel.hotel_search(@destination,@date1,@date2).paginate(page: params[:page], per_page: 4)
  end
  def index
    @countries = Embassy.all.pluck(:name).uniq.paginate(page: params[:page], per_page: 50)
    @embassies = Embassy.all 
  end
end

