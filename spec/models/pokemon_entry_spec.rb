require 'spec_helper'

describe PokemonEntry do
  it { should validate_uniqueness_of(:species_name) }
  it { should validate_presence_of(:species_name) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }

  describe '#random_pokemon_id' do
    it "should return a number between 1 and 151" do
      expect(1..151).to cover(PokemonEntry.random_pokemon_id)
    end
  end

end