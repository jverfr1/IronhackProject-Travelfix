class Embassy < ApplicationRecord
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
end
