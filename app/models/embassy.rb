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
  def self.get_th_emb_img
    img = Mechanize.new.get("http://www.thaiembassy.org/madrid").link_with(text: "Eng").click
    .search('.html-code').search('img')[0].attributes['src'].value
  end
  def self.get_visa_info
    visa_url = Mechanize.new.get("http://www.thaiembassy.org/madrid").link_with(text: "Eng").click
    .link_with(text: 'Visa').click.link_with(text: 'Información General').uri
    visa_uri = "#{visa_url.host}#{visa_url.path}" 
  end
  def self.read_pdf
    io     = open('http://www.thaiembassy.org/madrid/contents/images/text_editor/files/Informacion%20General.pdf')
    reader = PDF::Reader.new(io)
    visa = []
    reader.pages.each do |page|
      visa << page.text.strip
    end
    visa
  end
end

