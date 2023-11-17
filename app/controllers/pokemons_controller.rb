class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemons = Pokemon.find(params[:id])
    @stat = @pokemons.stat
    @types = @pokemons.types
    @abilities = @pokemons.abilities
  end
end
