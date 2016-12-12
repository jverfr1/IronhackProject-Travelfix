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
      if country.length < 30 && country != "Homepage"
        countries.push(country)
      end
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
  def self.hotel_search(destination, from, to)
    from = from.split(" ")

    agent = Mechanize.new

    page = agent.get('http://www.booking.com/index.es.html?label=gen173nr-1DCAEoggJCAlhYSDNiBW5vcmVmaEaIAQGYAQq4AQrIAQzYAQPoAQGoAgM;sid=b2cfc654f1a4615ffc199663a7de37d9;sb_price_type=total&')
    form = page.form

    form.fields[6].value=destination
    form.fields[7].value=from[0]
    form.fields[8].value=from[1].slice(0..-2)
    form.fields[9].value=from[2]
    form.fields[10].value=to[0]
    form.fields[11].value=to[1].slice(0..-2)
    form.fields[12].value=to[2]

    results =form.submit.search('.hotellist')  
    hotels = results.css('div.sr_item')
    hotels_results = []
    hotels.each do |hotel|
      hotels_results.push(hotel.css('h3').text)
    end
    hotels_results
  end
end
