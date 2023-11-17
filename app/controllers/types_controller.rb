class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @pokemons = @type.pokemons
  end
end
