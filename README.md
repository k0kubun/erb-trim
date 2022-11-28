# ERB::Trim

An ERB extension that supports `<%-=`.

## Installation

```
$ gem install erb-trim
```

## Usage

```rb
require 'erb/trim'

erb = <<-ERB
line
    <%-= 'value' %>
line
ERB

Erb::Trim.new(erb).result #=> "line\n\nline"
```
