class AddRarity < ActiveRecord::Migration
  def change
    add_column :pokemon_entries, :rarity, :integer
  end
end
