require "html/pipeline"

class AdditionalMarkdownFilter < HTML::Pipeline::MarkdownFilter
  AMF_CURLY_TAGS = %w(intro mac windows linux all tip warning error).join('|')
 def initialize(text, context = nil, result = nil)
    if context[:amf_use_blocks]
      text = text.gsub(/\{\{\s*#(#{AMF_CURLY_TAGS})\s*\}\}/, '[[#\1]]')
      text = text.gsub(/\{\{\s*\/(#{AMF_CURLY_TAGS})\s*\}\}/, '[[/\1]]')
    end

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

  def front_wrap
    @front_wrap ||= (context[:amf_use_blocks] != nil) ? "\\[\\[" : "\{\{"
  end

  def end_wrap
    @end_wrap  ||= (context[:amf_use_blocks] != nil) ? "\\]\\]" : "\}\}"
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
    html.gsub!(/<p>#{front_wrap}\s*#intro\s*#{end_wrap}<\/p>/,    '<div class="intro">')
    html.gsub!(/<p>#{front_wrap}\s*\/intro\s*#{end_wrap}<\/p>/,   '</div>')
  end

  def format_os_blocks!(html)
    html.gsub!(/<p>#{front_wrap}\s*#mac\s*#{end_wrap}<\/p>/,     '<div class="platform-mac">')
    html.gsub!(/<p>#{front_wrap}\s*#windows\s*#{end_wrap}<\/p>/, '<div class="platform-windows">')
    html.gsub!(/<p>#{front_wrap}\s*#linux\s*#{end_wrap}<\/p>/,   '<div class="platform-linux">')
    html.gsub!(/<p>#{front_wrap}\s*#all\s*#{end_wrap}<\/p>/,     '<div class="platform-all">')
    html.gsub!(/<p>#{front_wrap}\s*\/(mac|windows|linux|all)\s*#{end_wrap}<\/p>/, '</div>')
  end

  def format_admonition!(html)
    html.gsub!(/<p>#{front_wrap}\s*#tip\s*#{end_wrap}<\/p>/,     '<div class="alert tip">')
    html.gsub!(/<p>#{front_wrap}\s*#warning\s*#{end_wrap}<\/p>/, '<div class="alert warning">')
    html.gsub!(/<p>#{front_wrap}\s*#error\s*#{end_wrap}<\/p>/,   '<div class="alert error">')
    html.gsub!(/<p>#{front_wrap}\s*\/(tip|warning|error)\s*#{end_wrap}<\/p>/, '</div>')
  end
end
