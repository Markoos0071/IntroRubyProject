require 'httparty'

#Getting the first 151 entires from the pokemon endpoint from the PokeAPI
pokemon_url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=151'
pokemon = HTTParty.get(pokemon_url)

#Taking those results and sorting through each of them. Calling the individual pokemon's endpoint
#to get specific details. Also calling the species endpoint to get their species genus.
pokemon['results'].each do |poke|

  #Gets, and calls, the individual endpoint for each pokemon pulled from the API
  poke_url = poke['url']
  poke_details = HTTParty.get(poke_url)

  #Gets the endpoint for the specific details of each pokemon pulled from the API
  poke_species = HTTParty.get(poke_details['species']['url'])
  # puts poke_details['name'].capitalize
  # puts poke_species['genera'][7]['genus']
  # puts poke_details['height']
  # puts poke_details['weight']
  # poke_details['abilities'].each do |poke_ability|
  #  puts poke_ability['ability']['name'].capitalize
  # end
  #poke_details['types'].each do |poke_type|
  #  puts poke_type['type']['name'].capitalize
  #end
  puts poke_details['stats'][0]['base_stat']
  puts poke_details['stats'][1]['base_stat']
  puts poke_details['stats'][2]['base_stat']
  puts poke_details['stats'][3]['base_stat']
  puts poke_details['stats'][4]['base_stat']
  puts poke_details['stats'][5]['base_stat']

end