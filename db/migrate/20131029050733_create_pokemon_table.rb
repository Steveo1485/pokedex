class CreatePokemonTable < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.belongs_to :trainer
      t.string :name
      t.timestamps
    end
  end
end
