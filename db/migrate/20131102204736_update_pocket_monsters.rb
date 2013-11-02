class UpdatePocketMonsters < ActiveRecord::Migration
  def change
    add_column :pocket_monsters, :species_id, :integer
  end
end
