additional-markdown-filter
====================

Additional Markdown filters for the [HTML::Pipeline](https://github.com/jch/html-pipeline).

[![Build Status](https://travis-ci.org/gjtorikian/additional-markdown-filter.svg)](https://travis-ci.org/gjtorikian/additional-markdown-filter)

## Installation

Add this line to your application's Gemfile:

    gem 'additional-markdown-filter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install additional-markdown-filter

## Usage

The simplest way to do this is

``` ruby
require 'additional-markdown-filter'
```

Then just use the HTML pipeline normally.

### Within Jekyll

Because of the Liquid template engine, if you use this filter with Jekyll, you might find that your curly brace tags--such as `{{#tip}}`--disappear.

You'll need to pass the context `amf_use_blocks` through your filter. This sets up a totally safe monkey-patch to convert the `{{ }}` blocks into `[[ ]]`, so that Liquid ignores them. Then, this renderer will convert the Markdown appropriately.
