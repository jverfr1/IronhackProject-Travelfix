# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Embassy.get_countries_list.each do |country|
  if country.include? "Antigua"
    country = "Antigua & Barbuda"
  elsif country.include? "Grenadines"
    country = "St. Vincent & Grenadines"
  end  
  Embassy.country_embassies!(country).each do |country_embassy|
    Embassy.create(
      name: country,
      location_abroad: country_embassy[:location_abroad],
      title: country_embassy[:title],
      link: country_embassy[:link])
  end
end
