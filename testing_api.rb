require 'httparty'

#Reaching out and getting the first 151 entires from the pokemon endpoint from the PokeAPI
pokemon_url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=151'
pokemon = HTTParty.get(pokemon_url)

#Taking those results and sorting through each of them. Calling the individual pokemon's endpoint
#to get specific details. Also calling the species endpoint to get their species genus.
pokemon['results'].each do |poke|
  poke_url = poke['url']
  poke_details = HTTParty.get(poke_url)
  poke_species = HTTParty.get(poke_details['species']['url'])

  # puts poke_details['name'].capitalize
  # puts poke_species['genera'][7]['genus']
  # puts poke_details['height']
  # puts poke_details['weight']
  poke_details['types'].each do |poke_type|
    puts poke_type['type']['name'].capitalize
  end

end



# type_url = "https://pokeapi.co/api/v2/type?limit=18"
# types = HTTParty.get(type_url)

# types['results'].each do |type|
#   puts type['name'].capitalize
# end



# ability_url = "https://pokeapi.co/api/v2/ability?limit=100"
# abilities = HTTParty.get(ability_url)

# abilities['results'].each do |ability|
#   puts ability['name'].capitalize
# end