class PairUp::CLI
  def initialize(arguments)
    @arguments = arguments
  end

  def run
    PairUp::Campfire.new.paste(get_pairs)
  end

  private

  def get_pairs
    @pairs ||= pair_builder.pairs_to_string
  end

  def people
    PairUp::FileReader.new(file).readlines
  end

  def pair_builder
    PairUp::Combiner.new(people)
  end

  def file
    @arguments[0]
  end
end
