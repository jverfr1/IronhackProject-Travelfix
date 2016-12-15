class Embassy < ApplicationRecord
  private
  def self.mechanize
    page = Mechanize.new.get("http://www.embassy-worldwide.com/")
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
  def self.get_countries_embassies(countries)
    embassies_data = []    
    countries.each do |country|
      country_page = mechanize.link_with(text: country).click.search('.left-country-toggler')
      country_page.each do |embassy|
        add_embassy_data(embassies_data,embassy,country) if embassy.next.search('a').text.strip.include? "Embassy"
      end
    end
    embassies_data
  end
        
  def self.add_embassy_data(array, embassy,country)
    array << {
      location_abroad: embassy.text,
      title: embassy.next.search('a').text.strip,
      name: country,
      link: embassy.next.search('a')[0].attributes['href'].value   
    }
  end

  def self.mechanize
    page = mechanize.get("http://www.embassy-worldwide.com/")
  end
  # def self.get_countries_list
  #   countries = []
  #   mechanize.search('.cat_col').each do |country|
  #     country.search('span').each do |country_name|
  #       countries << country_name.text.strip
  #     end
  #   end
  #   countries
  # end
end


