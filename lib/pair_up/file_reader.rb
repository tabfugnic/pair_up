class PairUp::FileReader
  def initialize(file)
    @file = File.open(file)
  end

  def readlines
    read.split("\n")
  end

  private

  def read
    @file.read
  end
end
