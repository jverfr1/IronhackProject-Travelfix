class Hotel < ApplicationRecord
  def self.hotel_search(destination, from, to)

    hotels_results = []
    hotels =fill_form(destination, from, to).search('.h-listing')[0].search('.hotel-wrap') 
    hotels.each do |hotel|
      hotels_results << {
        price_description: get_price_description(hotel),
        last_reservation:  last_reservation(hotel),
        location_info:     get_location_info(hotel),
        address:           get_address(hotel),
        image:             get_image(hotel),
        stars:             get_stars(hotel),
        price:             get_price(hotel),
        phone:             get_phone(hotel),
        name:              get_name(hotel),
        link:              get_link(hotel)
        }
    end
    hotels_results

  end
  def self.get_name(hotel)
    hotel.search('.description').search('h3').text.chomp
  end
  def self.last_reservation(hotel)
    hotel.search('.description').search('.messaging').text.chomp
  end
  def self.get_link(hotel)
    "https://es.hoteles.com/"+hotel.search('.description').search('h3').search('a')[0].attributes["href"].value
  end
  def self.get_address(hotel)
    hotel.search('.description').search('.contact').search('.p-adr').text.chomp
  end
  def self.get_phone(hotel)
    hotel.search('.description').search('.contact').search('.p-tel').text.chomp
  end
  def self.get_image(hotel)
    hotel.search('.description').search('.image-and-details')[0].search('.image')[0]
    .children[0].search('img')[0].attributes['style'].value.split("'")[1].to_s  
  end
  def self.format_date(date)
    Date.parse(date).strftime('%d/%m/%Y')
  end
  def self.get_stars(hotel)
    hotel.search('.description').search('.star-rating-container')[0].search('.widget-tooltip-bd').text.slice!(0)
  end
  def self.get_price(hotel)
    hotel.search('.pricing').search('.price')[0].text
  end
  def self.get_price_description(hotel)
    hotel.search('.pricing').search('.price-breakdown').text
  end
  def self.get_location_info(hotel)
    hotel.search('.location-info').search('li').text.chomp
  end
  def self.check_date(date)
    date >= Date.today.strftime('%d %B,%Y')
  end
  def self.mechanize
    page = Mechanize.new.get("https://es.hoteles.com")
  end
  def self.fill_form(destination,from, to)
    form = mechanize.forms[0]
    form.fields[0].value=destination
    form.fields[1].value=format_date(from)
    form.fields[3].value=format_date(to)
    form.submit
  end
end
