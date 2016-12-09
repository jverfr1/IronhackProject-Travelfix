# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Embassy.get_countries_list.each do |country|
#   Embassy.create(name: country)
# end
Embassy.get_countries_list.each do |country|
  if country.include? "Antigua"
    country = "Antigua & Barbuda"
  elsif country.include? "Grenadines"
    country = "St. Vincent & Grenadines"
  end  
  Embassy.country_embassies!(country).each do |country_embassy|
    Embassy.create(
      name: country,
      abroad: country_embassy)
  end
end

#     for i in 1..Embassy.spain_embassies!.length

#       Embassy.create(
#         abroad: Embassy.spain_embassies![i])
#     end