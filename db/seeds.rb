require 'httparty'

#Getting the first 151 entires from the pokemon endpoint from the PokeAPI
pokemon_url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=151'
pokemon_response = HTTParty.get(pokemon_url)

#Taking those results and sorting through each of them. Calling the individual pokemon's endpoint
#to get specific details. Also calling the species endpoint to get their species genus.
pokemon_response['results'].each do |poke|

  #Gets, and calls, the individual endpoint for each pokemon pulled from the API
  poke_url = poke['url']
  poke_details = HTTParty.get(poke_url)

  #Gets the endpoint for the specific details of each pokemon pulled from the API
  poke_species = HTTParty.get(poke_details['species']['url'])

  #Creating the records for the Pokemon table with data from the API
   new_pokemon = Pokemon.create(
     name: poke_details['name'].capitalize,
     height: poke_details['height'],
     weight: poke_details['weight'],
     species: poke_species['genera'][7]['genus']
   )

  #Creating the records for the Ability table with data from the API
  poke_details['abilities'].each do |poke_ability|
   ability_name = poke_ability['ability']['name'].capitalize
   ability = Ability.find_or_create_by(name: ability_name)
   new_pokemon.abilities << ability
  end

  #Creating the records for the Type table with data from the API
  poke_details['types'].each do |poke_type|
   type_name = poke_type['type']['name'].capitalize
   type = Type.find_or_create_by(name: type_name)
   new_pokemon.types << type
  end

  #Creating the records for the Stats table with data from the API
  new_pokemon.create_stat(
    hp: poke_details['stats'][0]['base_stat'],
    attack: poke_details['stats'][1]['base_stat'],
    defense: poke_details['stats'][2]['base_stat'],
    special_attack: poke_details['stats'][3]['base_stat'],
    special_defense: poke_details['stats'][4]['base_stat'],
    speed: poke_details['stats'][5]['base_stat']
  )
end