require "scratch_config_reader/version"
require "scratch_config_reader/base"

module ScratchConfigReader

  # Returns a ScratchConfigReader::Base object, with the file parsed.
  # This is needlessly complicated for such a simple exercise, but demonstrates
  # a structure concept for a larger project.
  def self.parse(filepath)
    ScratchConfigReader::Base.new(filepath)
  end

end
