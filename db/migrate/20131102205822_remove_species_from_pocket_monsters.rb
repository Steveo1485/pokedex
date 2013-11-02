class RemoveSpeciesFromPocketMonsters < ActiveRecord::Migration
  def change
    remove_column :pocket_monsters, :species
  end
end
