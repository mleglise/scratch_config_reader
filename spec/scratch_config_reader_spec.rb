require 'scratch_config_reader'

RSpec.describe ScratchConfigReader do

  describe "basic initialization" do
    parsed = ScratchConfigReader.parse('fred.txt')
    it { expect(parsed).to be_a ScratchConfigReader::Base }
  end

end
