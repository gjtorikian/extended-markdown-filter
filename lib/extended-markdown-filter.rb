require 'html/pipeline'
require 'filters/filters'

Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "filters", "pre", "*.rb")].each do |file|
  require file
end

Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "filters", "post", "*.rb")].each do |file|
  require file
end

class ExtendedMarkdownFilter < HTML::Pipeline::MarkdownFilter
  include Filters::PreFilter
  include Filters::PostFilter

  EMF_CURLY_TAGS = %w(intro mac windows linux all tip warning error).join('|')

  def initialize(text, context = nil, result = nil)
    if defined?(Jekyll) && context[:emf_use_blocks]
      require 'jekyll-override'
    end

    if context[:emf_use_blocks]
      text = self.class.convert_curly_to_bracket(text)
    end

    Filters.context = context

    # do preprocessing, then call HTML::Pipeline::Markdown
    format_command_line!    text
    format_helper!          text

    super text, context, result
  end

  def self.convert_curly_to_bracket(text)
    text = text.gsub(/\{\{\s*#(#{EMF_CURLY_TAGS})\s*\}\}/, '[[#\1]]')
    text = text.gsub(/\{\{\s*\/(#{EMF_CURLY_TAGS})\s*\}\}/, '[[/\1]]')
    text = text.gsub(/\{\{\s*(octicon-\S+\s*[^\}]+)\s*\}\}/,  '[[\1]]')

    text
  end

  def call
    # initialize HTML::Pipeline::Markdown, then do post-processing
    html = super

    format_intro!           html
    format_os_blocks!       html
    format_admonitions!     html
    format_octicons!        html

    html
  end

end
