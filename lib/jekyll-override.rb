# Liquid disregards tags it doesn't know,
# so rather than define a new format for additions like {{#tip}},
# we'll convert them to bracket form
module Jekyll
  class Renderer
    alias_method :old_run, :run

    def run
      if ENV['OVERRIDE_JEKYLL_RENDER'] == "true"
        document.content = ExtendedMarkdownFilter.convert_curly_to_bracket(document.content)
      end
      old_run
    end
  end
end
