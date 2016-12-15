class Embassy < ApplicationRecord
# def self.mechanize
#     page = Mechanize.new.get("http://www.embassy-worldwide.com/")
#   end
  # def self.get_countries_list
  #   countries = []
  #   mechanize.search('.cat_col').each do |country|
  #     country.search('span').each do |country_name|
  #       countries << country_name.text.strip
  #     end
  #   end
  #   countries
  # end
  # def self.get_countries_embassies(countries)
  #   embassies_data = []    
  #   countries.each do |country|
  #     country_page = mechanize.link_with(text: country).click.search('.left-country-toggler')
  #     country_page.each do |embassy|
  #       add_embassy_data(embassies_data,embassy,country) if embassy.next.search('a').text.strip.include? "Embassy"
  #     end
  #   end
  #   embassies_data
  # end
        
  # def self.add_embassy_data(array, embassy,country)
  #   array << {
  #     location_abroad: embassy.text,
  #     title: embassy.next.search('a').text.strip,
  #     name: country,
  #     link: embassy.next.search('a')[0].attributes['href'].value   
  #   }
  # end

def self.get_countries_list
    mechanize = Mechanize.new
    countries =  []
    page = mechanize.get('http://www.embassy-worldwide.com/')
    list = page.search('.cat_col').each do |country|
      country.search('span').each do |country_name|
        countries << country_name.text.strip
     end
    end
    countries
  end
  def self.country_embassies!(country)
    mechanize = Mechanize.new
    page = mechanize.get("http://www.embassy-worldwide.com/")
    country = page.link_with(text:country)
      sspain = country.click
      left = sspain.search('.left-country-toggler')
      country_embassies = []

      left.each do |el|
    
        if el.next.text.include? "Embassy"
            country_embassies << {
              name: country,
              location_abroad: el.text.strip,
              link: el.next.search('a')[0].attributes['href'].value,
              title: el.next.search('a').text.strip
            }
        end      
    end
    country_embassies
  end
  def self.get_contact_info(url)
    contact_info = []
    page = Mechanize.new.get(url).search('ul.embassy-data').search('li').each do |li|
      hash={}
      hash[li.search('span').text.strip.to_sym] = li.children[1].text.strip
      contact_info << hash
    end   
    contact_info
  end
end

# s.search('ul.embassy-data').search('li').each     

# address:  [0].search('span')[0].text   Datos: search('ul.embassy-data').search('li')[0].children[1].text.strip 

# CITY: [1].children[1].text


# services for thai citizens:  .search('.post-content').search('ul')[2].text.strip 

# services for spanish citizens:  .search('.post-content').search('ul')[3].text.strip 

# visa info title: .search('.post-content').search('h3')[1].children.children.text   

#   visa info: search('.post-content').search('h3')[1].next.next  
