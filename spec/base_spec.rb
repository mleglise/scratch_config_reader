require 'scratch_config_reader'

RSpec.shared_examples "parsed boolean" do |input, output_key, output_val|
  parsed = ScratchConfigReader::Base.parse_line(input)
  it { expect(parsed).to be_an Array }
  it { expect(parsed[0]).to be_a String }
  it { expect(parsed[0]).to eq output_key }
  it { expect(parsed[1]).to eq output_val }
end

RSpec.shared_examples "parsed string" do |input, output_key, output_val|
  parsed = ScratchConfigReader::Base.parse_line(input)
  it { expect(parsed).to be_an Array }
  it { expect(parsed[0]).to be_a String }
  it { expect(parsed[0]).to eq output_key }
  it { expect(parsed[1]).to be_a String }
  it { expect(parsed[1]).to eq output_val }
end

RSpec.describe "ScratchConfigReader::Base" do

  describe "retrieval" do
    let(:base){ ScratchConfigReader::Base.new('example/config_file.txt') }

    describe "[]" do
      it { expect(base['host']).to eq 'test.com' }
      it { expect(base[:log_file_path]).to eq '/tmp/logfile.log' }
      it { expect(base[:unknown]).to eq nil }
    end

    describe "fetch" do
      it { expect(base.fetch('host')).to eq 'test.com' }
      it { expect(base.fetch(:unknown, )).to eq nil }
      it { expect(base.fetch(:unknown, 'foobar')).to eq 'foobar' }
    end

    describe "key" do
      it { expect(base.key?('host')).to eq true }
      it { expect(base.key?(:host)).to eq true }
      it { expect(base.key?(:unknown)).to eq false }
    end
  end

  describe "line parsing" do
    context "empty" do
      parsed = ScratchConfigReader::Base.parse_line('')
      it { expect(parsed).to be_nil }
    end

    context "comment" do
      parsed = ScratchConfigReader::Base.parse_line('# comment line')
      it { expect(parsed).to be_nil }
    end

    context "booleans" do
      include_examples "parsed boolean", 'verbose =true', 'verbose', true
      include_examples "parsed boolean", 'verbose =false', 'verbose', false
      include_examples "parsed boolean", 'test_mode = on', 'test_mode', true
      include_examples "parsed boolean", 'debug_mode = off', 'debug_mode', false
      include_examples "parsed boolean", 'send_notifications = yes', 'send_notifications', true
      include_examples "parsed boolean", 'send_notifications = no', 'send_notifications', false
    end

    context "strings" do
      include_examples "parsed string", 'host = test.com', 'host', 'test.com'
      include_examples "parsed string", 'user= user', 'user', 'user'
      include_examples "parsed string", 'log_file_path = /tmp/logfile.log', 'log_file_path', '/tmp/logfile.log'
    end

    context "integer" do
      parsed = ScratchConfigReader::Base.parse_line('server_id=55331')
      it { expect(parsed).to be_an Array }
      it { expect(parsed[0]).to be_a String }
      it { expect(parsed[0]).to eq 'server_id' }
      it { expect(parsed[1]).to be_an Integer }
      it { expect(parsed[1]).to eq 55331 }
    end

    context "decimal" do
      parsed = ScratchConfigReader::Base.parse_line('server_load_alarm=2.5')
      it { expect(parsed).to be_an Array }
      it { expect(parsed[0]).to be_a String }
      it { expect(parsed[0]).to eq 'server_load_alarm' }
      it { expect(parsed[1]).to be_a Float }
      it { expect(parsed[1]).to eq 2.5 }
    end

  end

end
