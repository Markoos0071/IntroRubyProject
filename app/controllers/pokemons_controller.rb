class PokemonsController < ApplicationController
  def index
    pokemons = Pokemon.all

    @pokemons = pokemons.page(params[:page]).per(15)


    if params[:type_id].present?
      @pokemons = @pokemons.joins(:types).where(types: { id: params[:type_id] })
    end

    if params[:ability_id].present?
      @pokemons = @pokemons.joins(:abilities).where(abilities: { id: params[:ability_id] })
    end

    if params[:name].present?
      @pokemons = @pokemons.where("lower(pokemons.name) LIKE ?", "%#{params[:name].downcase}%")
    end



  end

  def show
    @pokemons = Pokemon.find(params[:id])
    @stat = @pokemons.stat
    @types = @pokemons.types
    @abilities = @pokemons.abilities
  end

  def reset_search
    redirect_to pokemons_path
  end
end
