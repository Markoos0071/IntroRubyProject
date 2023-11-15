#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'httparty'

pokemon_url = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=151'
response_pokemon = HTTParty.get(pokemon_url)
response_pokemon.parsed_response