# Liquid disregards tags it doesn't know,
# so rather than define a new format for additions like {{#tip}},
# we'll convert them to bracket form
module Jekyll
  class Renderer
    alias_method :old_run, :run

    def run
      if ExtendedMarkdownFilter.should_jekyll_replace?(site)
        document.content = ExtendedMarkdownFilter.convert_curly_to_bracket(document.content)
      end
      old_run
    end

  end
end

module Jekyll
  class Page
    alias_method :old_render, :render

    def render(layouts, site_payload)
      if ExtendedMarkdownFilter.should_jekyll_replace?(site)
        self.content = ExtendedMarkdownFilter.convert_curly_to_bracket(content)
      end
      old_render(layouts, site_payload)
    end
  end
end
