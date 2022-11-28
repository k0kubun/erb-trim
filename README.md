# ERB::Trim

An ERB extension that supports `<%-=`. [ruby/erb#24](https://github.com/ruby/erb/issues/24)

## Installation

```
$ gem install erb-trim
```

## Usage

```rb
require 'erb/trim'

erb_notrim = "  <%-= 'value' %>"
erb_trim   = "  <%-= 'value' if false %>"

ERB::Trim.new(erb_notrim).result #=> "  value"
ERB::Trim.new(erb_trim).result   #=> ""
```
