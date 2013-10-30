class CreatePocketMonsters < ActiveRecord::Migration
  def change
    create_table :pocket_monsters do |t|
      t.belongs_to :trainer
      t.string :species
      t.timestamps
    end
  end
end
