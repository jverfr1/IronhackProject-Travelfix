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
end
