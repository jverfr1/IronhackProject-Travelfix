class Embassy < ApplicationRecord
  private
  def self.get_countries_list
    mechanize = Mechanize.new

    page = mechanize.get('http://www.embassy-worldwide.com/')

    span = page.search('span')

    array = []
    span.each do |country|
      array.push(country.child.to_s)
    end

    countries = []
    array.map! do |country|
        countries.push(country) if (country.length < 30 && country != "Homepage")
    end
    countries.slice!(-1)
    countries
  end
  def self.country_embassies!(country)
    mechanize = Mechanize.new
    page = mechanize.get("http://www.embassy-worldwide.com/")
    if country.include? "Antigua"
      country = "Antigua & Barbuda"
    elsif country.include? "Grenadines"
      country = "St. Vincent & Grenadines"
    end
    country = page.link_with(text:country)
    if country != nil
      sspain = country.click
      left = sspain.search('.left-country-toggler')
      country_embassies = []

      left.each do |el|
    
        if el.next.text.include? "Embassy"
    
          a = el.text
          country_embassies.push(a)
        end      
      end
    end
    country_embassies
  end
  # def self.hotel_search(destination, from_date, to_date)
  def self.hotel_search(destination, from, to)

    hotels_results = []
    hotels =fill_form(destination, from, to).search('.h-listing')[0].search('.hotel-wrap').search('.description') 
    hotels.each do |hotel|
      hotels_results.push({
        name: get_name(hotel),
        last_reservation: last_reservation(hotel),
        link: get_link(hotel),
        address: get_address(hotel),
        image: get_image(hotel),
        })
    end
    hotels_results

  end
  def self.get_name(hotel)
    hotel.search('h3').text.chomp
  end
  def self.last_reservation(hotel)
    hotel.search('.messaging').text.chomp
  end
  def self.get_link(hotel)
    "https://es.hoteles.com/"+hotel.search('h3').search('a')[0].attributes["href"].value
  end
  def self.get_address(hotel)
    hotel.search('.contact').text.chomp
  end
  def self.get_image(hotel)
    hotel.search('.image-and-details')[0].search('.image')[0].children[0].search('img')[0].attributes['style'].value.split("'")[1].to_s  
  end
  def self.format_date(date)
    Date.parse(date).strftime('%d/%m/%Y')
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
