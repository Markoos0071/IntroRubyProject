class CreateJoinTablePokemonNature < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pokemons, :natures do |t|
      # t.index [:pokemon_id, :nature_id]
      # t.index [:nature_id, :pokemon_id]
    end
  end
end
