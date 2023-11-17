class AddPokemonReferenceToStats < ActiveRecord::Migration[7.0]
  def change
    add_reference :stats, :pokemon, null: false, foreign_key: true
  end
end
