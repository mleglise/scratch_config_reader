module ScratchConfigReader

  class Base
    @@true_strings = %w(true yes on)
    @@false_strings = %w(false no off)

    def initialize(filepath)
      @config_file = File.join( FileUtils.pwd, filepath )
    end

    # Returns a key/value pair for a successfully parsed line.
    # Returns nil for comments or errors.
    def self.parse_line(line)
      # Handle empty, comment, or invalid lines
      return nil if line.empty? || line.start_with?('#') || !line.include?('=')

      # Handle basic key/value string mapping
      parsed = line.split('=').map(&:strip)

      # Handle boolean values
      if @@true_strings.include? parsed[1]
        parsed[1] = true
      elsif @@false_strings.include? parsed[1]
        parsed[1] = false

      # Handle integers
      elsif parsed[1] =~ /^\d+$/
        parsed[1] = parsed[1].to_i

      # Handle floats
      elsif parsed[1] =~ /^\d+\.?\d+$/
        parsed[1] = parsed[1].to_f
      end

      # Return final result
      parsed
    end

  end

end
