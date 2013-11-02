require 'spec_helper'

describe PokemonEntry do
  it { should validate_uniqueness_of(:species_name) }
  it { should validate_presence_of(:species_name) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }
end