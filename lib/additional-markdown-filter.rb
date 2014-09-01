require "html/pipeline"

class AdditionalMarkdownFilter < HTML::Pipeline::MarkdownFilter
 def initialize(text, context = nil, result = nil)
    # do preprocessing, then call HTML::Pipeline::Markdown
    format_command_line!    text
    format_helper!          text

    super text, context, result
  end

  def call
    # initialize HTML::Pipeline::Markdown, then do post-processing
    html = super

    format_intro!           html
    format_os_blocks!       html
    format_admonition!      html

    html
  end

  def format_command_line!(text)
    text.gsub! /\n?``` command-line(.+?)```/m do |block|
      block.gsub! /^``` command-line/, '<pre class="command-line">'
      block.gsub! /^```$/, "</pre>\n"
      block.gsub!(/^\$ (.+)$/) { %Q|<span class="command">#{$1.rstrip}</span>| }
      block.gsub!(/^(\# .+)$/) { %Q|<span class="comment">#{$1.rstrip}</span>| }
      block.gsub!(/^> (.+)$/) { %Q|<span class="output"><span># </span>#{$1.rstrip}</span>| }

      block
    end
  end

  def format_helper!(text)
    text.gsub! /\n?``` helper(.+?)```/m do |block|
      block.gsub! /^``` helper\s*/, ''
      block.gsub! /^```$/, ''

      header = ''
      block.gsub! /^#### (.+?)$/ do
        header = $1.strip
        ''
      end

      content = block.strip
      content = "<p>#{content}</p>" unless content =~ /^<p/
      content = "<div class='helper'><h4 class='header'><a href='#'>#{header}</a></h4><div class='content'>#{content}</div></div>"
    end
  end

  def format_intro!(html)
    html.gsub!(/<p>{{#intro}}<\/p>/,    '<div class="intro">')
    html.gsub!(/<p>{{\/intro}}<\/p>/,   '</div>')
  end

  def format_os_blocks!(html)
    html.gsub!(/<p>{{#mac}}<\/p>/,     '<div class="platform-mac">')
    html.gsub!(/<p>{{#windows}}<\/p>/, '<div class="platform-windows">')
    html.gsub!(/<p>{{#linux}}<\/p>/,   '<div class="platform-linux">')
    html.gsub!(/<p>{{#all}}<\/p>/,     '<div class="platform-all">')
    html.gsub!(/<p>{{\/(mac|windows|linux|all)}}<\/p>/, '</div>')
  end

  def format_admonition!(html)
    html.gsub!(/<p>{{#(tip|warning|error)}}<\/p>/,  '<div class="alert \1">')
    html.gsub!(/<p>{{\/(tip|warning|error)}}<\/p>/, '</div>')
  end
end
