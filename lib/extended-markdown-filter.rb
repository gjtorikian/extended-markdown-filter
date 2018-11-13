require 'html/pipeline'
require 'filters/filters'
require 'jekyll-override' unless defined?(Jekyll).nil?

class ExtendedMarkdownFilter < HTML::Pipeline::MarkdownFilter
  include Filters::PreFilter
  include Filters::PostFilter

  EMF_CURLY_TAGS = %w(intro mac windows linux all tip note warning danger).join('|')

  def initialize(text, context = nil, result = nil)
    if context[:emf_use_blocks]
      text = self.class.convert_curly_to_bracket(text)
      @front_wrap = '\\[\\['
      @end_wrap = '\\]\\]'
      @wrap_symbol = '\\]'
    else
      @front_wrap = "\{\{"
      @end_wrap = "\}\}"
      @wrap_symbol = '}'
    end

    # do preprocessing, then call HTML::Pipeline::Markdown
    text = format_helper          text

    super text, context, result
  end

  def self.convert_curly_to_bracket(text)
    return text if text.nil?
    text = text.gsub(/\{\{#(#{EMF_CURLY_TAGS})\}\}/, '[[#\1]]')
    text = text.gsub(/\{\{\/(#{EMF_CURLY_TAGS})\}\}/, '[[/\1]]')
    text = text.gsub(/\{\{ (octicon-\S+\s*[^\}]+) \}\}/,  '[[\1]]')

    text
  end

  def self.should_jekyll_replace?(site)
    html_pipeline_context = site.site_payload['site']['html_pipeline'] && site.site_payload['site']['html_pipeline']['context']
    return false if html_pipeline_context.nil?
    pipeline_emf_context = site.site_payload['site']['html_pipeline']['context'][:emf_use_blocks] || site.site_payload['site']['html_pipeline']['context']['emf_use_blocks']
    site.site_payload['site']['markdown'] == 'HTMLPipeline' && html_pipeline_context && pipeline_emf_context
  end

  def call
    # initialize HTML::Pipeline::Markdown, then do post-processing
    html = super

    format_intro!           html
    format_os_blocks!       html
    format_admonitions!     html
    format_octicons!        html
    format_command_line!    html

    html
  end

end
