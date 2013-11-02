class CreatePokemonInfoTable < ActiveRecord::Migration
  def change
    create_table :pokemon_entries do |t|
      t.string :species_name
      t.integer :height
      t.integer :weight
      t.timestamps
    end
  end
end
