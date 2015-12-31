# extended-markdown-filter

Extended Markdown filters for the [HTML::Pipeline](https://github.com/jch/html-pipeline).

[![Build Status](https://travis-ci.org/gjtorikian/extended-markdown-filter.svg)](https://travis-ci.org/gjtorikian/extended-markdown-filter)

## Installation

Add this line to your application's Gemfile:

    gem 'extended-markdown-filter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extended-markdown-filter

## Usage

The simplest way to do this is

``` ruby
require 'extended-markdown-filter'
```

Then just use the HTML pipeline normally. With Jekyll, this is meant to be used with another plugin in conjunction, https://github.com/gjtorikian/jekyll-html-pipeline.

A minimum config file might look like:
``` yaml
gems:
  - extended-markdown-filter
  - jekyll-html-pipeline

markdown: HTMLPipeline
html_pipeline:
  filters:
    - "ExtendedMarkdownFilter"
  context:
    emf_use_blocks: true
```

### Within Jekyll

Because of the Liquid template engine, if you use this filter with Jekyll, you might find that your curly brace tags--such as `{{#tip}}`--disappear.

You'll need to pass the context `emf_use_blocks` through your filter. This sets up a totally safe monkey-patch to convert the `{{ }}` blocks into `[[ ]]`, so that Liquid ignores them. Then, this renderer will convert the Markdown appropriately.

## What does this add?

You may be wondering what features this filter adds to Markdown. Great question! Here's what we've got:

### Command-line highlighting

A new pre block, `command-line`, adds some divs to allow for better highlighting for terminal code.

#### Example

    ``` command-line
    $ git remote add origin https://github.com/<em>user</em>/<em>repo</em>.git
    # Set a new remote
    > origin  https://github.com/user/repo.git
    ```

* `$` represents content a user enters
* `<em>` highlights content for the user
* `#` represents comments
* `>` represents output as a result of a command

### Helper

The `helper` notation wraps content in an [accordion fold](http://jqueryui.com/accordion/).

#### Example

    ``` helper
    I'm not really important enough to show.
    ```

### Admonition blocks

You can create separate, priority-colored callouts with `{{#tip}}`, `{{#note}}`, `{{#warning}}`, and `{{#error}}` tags.

#### Example

    {{#tip}}

    Here's a hot tip: **line one**
    Here's a hot tip: line two

    {{/tip}}

    {{#note}}

    You should probably know this! line one
    You should probably know this! line two

    {{/note}}

    {{#warning}}

    Yo, check this out: line one
    Yo, check this out: line two

    {{/warning}}

    {{#danger}}

    Sheeeeit, this is a problem: ~~line one~~
    Sheeeeit, this is a problem: line two

    {{/danger}}

### Intro

The `intro` block demarcates a special section that provides a summary of the content to follow.

#### Example

    {{#intro}}

    [Gists](https://gist.github.com) are a great way to share your work. You can share single files, parts of files, or full applications.

    {{/intro}}

### Octicon

The `{{ octicon }}` helper lets you easily render [any Octicon](https://octicons.github.com/) in the content, including an aria label.

#### Example

    {{ octicon-gear The Settings gear }}

### Operating system blocks

Sometimes, certain content needs to be rendered for only a certain operating system. Use `{{#mac}}` of Mac OS specific content, `{{#windows}}` for Windows, `{{#linux}}` for Linux, and `{{#all}}` as a catch-all for everything else.

#### Example

    {{#mac}}

    1. Command-click on the option.

    {{/mac}}

    {{#windows}}

    1. Right click on the **Start** menu.

    {{/windows}}

    {{#linux}}

    1. Open the terminal.

    {{/linux}}

    {{#all}}

    1. Double-click on the icon.

    {{/all}}
