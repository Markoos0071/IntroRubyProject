class AbilitiesController < ApplicationController
  def show
    @ability = Ability.find(params[:id])
    @pokemons = @ability.pokemons
  end
end
