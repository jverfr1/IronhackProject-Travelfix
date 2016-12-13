module EmbassiesHelper
  def print_hotels_links(hotel)
    hotel
  end
  def booking_url
    @bookin="http://booking.com"
  end
  def stars(number)
    @star=[]
    number.to_i.times do
      @star.push("<i class='fa fa-star-o' aria-hidden='true'></i>")
    end
    @star.join().html_safe
  end
end
