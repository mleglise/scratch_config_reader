# ScratchConfigReader

NOT FOR USE IN PRODUCTION.
This is a basic exercise in standard Ruby.


## Installation

Although packaged as a gem, this is just a demo. It's not meant to be used as
a gem! Just download the source code repo, open a command line, and navigate to
this folder. Then execute:

```bash
$ bundle
```

## Usage

Run spec tests:
```bash
$ rake spec
```

Use it in an interactive console:
```bash
$ pry
```

```ruby
require 'scratch_config_reader'
config = ScratchConfigReader.parse('spec/example/config_file.txt')
config['server_id']
config[:verbose]
```


## Known Limitations

* Cannot parse Integers or Floats that contain commas.
* Values '0' or '1' will be interpreted as Integers, not true/false.
* Keys are stored as strings, although ideally they should be symbols.
