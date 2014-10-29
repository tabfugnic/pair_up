require 'spec_helper'

describe PairUp::Combiner do
  describe '#pairs_to_string' do
    it 'returns a string of paired people' do
      people = ['people', 'people']

      pair_string = PairUp::Combiner.new(people).pairs_to_string

      expect(pair_string).to eq("people <==> people")
    end
  end
end
