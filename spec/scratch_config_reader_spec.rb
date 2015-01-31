require 'scratch_config_reader'

RSpec.describe ScratchConfigReader do

  describe "basic initialization" do
    parsed = ScratchConfigReader.parse('example/config_file.txt')
    it { expect(parsed).to be_a ScratchConfigReader::Base }
  end

end
