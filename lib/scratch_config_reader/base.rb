module ScratchConfigReader

  class Base
    @@true_strings = %w(true yes on)
    @@false_strings = %w(false no off)

    def initialize(filepath)
      @config_file = File.join( FileUtils.pwd, filepath )
      @values = {}

      unless File.exist?(@config_file)
        puts "File Not Found: #{@config_file}"
        return false
      end

      # Read the file, parse the lines, and add them to the values hash.
      File.open(@config_file) do |cfile|
        cfile.each do |line|
          if parsed_line = self.class.parse_line(line)
            @values[ parsed_line[0] ] = parsed_line[1]
          end
        end
      end
    end

    #############################################
    # Accessor methods
    def [](key)
      fetch(key.to_s)
    end

    def fetch(key, default_value = nil)
      key = key.to_s
      if key?(key)
        return @values[key]
      elsif default_value
        return default_value
      else
        return nil
      end
    end

    def key?(key)
      @values.key?(key.to_s)
    end

    #############################################
    # Primary parsing method
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
