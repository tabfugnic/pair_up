class PairUp::Combiner
  def initialize(people)
    @people = people
    if @people.length % 2 != 0
      raise "Not an Even Number"
    end
  end

  def pairs_concat
    pairs.map do |pair|
      sprintf("%#{string_length}s <==> %s", pair[0], pair[1])
    end
  end

  def pairs_to_string
    pairs_concat.join("\n")
  end

  private

  def pairs
    shuffle.each_slice(2).to_a
  end

  def shuffle
    @people.shuffle
  end

  def string_length
    @people.max.length
  end
end
