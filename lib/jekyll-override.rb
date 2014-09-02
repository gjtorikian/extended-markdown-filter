# Liquid disregards tags it doesn't know,
# so rather than define a new format for additions like {{#tip}},
# we'll convert them to block form
module Jekyll
  class Page
    old_render = self.instance_method(:render)

    define_method(:render) do |layouts, site_payload|
      unless self.content.nil?
        self.content = ExtendedMarkdownFilter.convert_curly_to_bracket(self.content)
      end
      old_render.bind(self).call(layouts, site_payload)
    end
  end
end
