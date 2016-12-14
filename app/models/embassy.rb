class Embassy < ApplicationRecord
  private
  # def self.get_countries_list
  #   mechanize = Mechanize.new

  #   page = mechanize.get('http://www.embassy-worldwide.com/')

  #   span = page.search('span')

  #   array = []
  #   span.each do |country|
  #     array.push(country.child.to_s)
  #   end

  #   countries = []
  #   array.map! do |country|
  #       countries.push(country) if (country.length < 30 && country != "Homepage")
  #   end
  #   countries.slice!(-1)
  #   countries
  # end
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

  def self.mechanize
    page = mechanize.get("http://www.embassy-worldwide.com/")
  end
  def self.get_countries_list
    countries = []
    mechanize.search('.cat_col').each do |country|
      country.search('span').each do |country_name|
        countries << country_name.text.strip
      end
    end
    countries
  end
  def print(countries)
    puts countries
    puts countries.size
  end
end


embassies_abroad = []
spain.each do |embassy|
  if embassy.next.search('a').text.include? "Embassy"
    embassies_abroad << {   
      title: embassy.next.search('a').text,
      link: embassy.next.search('a')[0].to_html
    }
  end
end