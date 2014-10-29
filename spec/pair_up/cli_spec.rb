require 'spec_helper'

describe PairUp::CLI do
  describe "#run" do
    it 'sends paste to campfire' do
      filename = "path/to/file"
      stub_filereader(filename)
      stub_campfire

      campfire_response = PairUp::CLI.new([filename]).run

      expect(campfire_response).to eq("success")
    end
  end

  def stub_filereader(filename)
    allow(PairUp::FileReader)
      .to receive(:new)
      .with(filename)
      .and_return(double(PairUp::FileReader, readlines: ["people", "people"]))
  end

  def stub_campfire
      allow(PairUp::Campfire)
        .to receive(:new)
        .and_return(double(PairUp::Campfire, paste: "success"))
  end
end
