# ScratchConfigReader

NOT FOR USE IN PRODUCTION.
This is a basic exercise in standard Ruby.


## Installation

Add this line to your application's Gemfile:

    gem 'scratch_config_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scratch_config_reader

## Usage

Run spec tests:
```bash
$ rake spec
```


## Known Limitations

* Cannot parse Integers or Floats that contain commas.
* Values '0' or '1' will be interpreted as Integers, not true/false.
* Keys are stored as strings, although ideally they should be symbols.
