# Liquid disregards tags it doesn't know,
# so rather than define a new format for additions like {{#tip}},
# we'll convert them to bracket form
module Jekyll
  class Renderer
    alias_method :old_run, :run

    def run
      html_pipeline_context = site.site_payload["site"]["html_pipeline"] && site.site_payload["site"]["html_pipeline"]["context"]
      if site.site_payload["site"]["markdown"] == "HTMLPipeline" && html_pipeline_context && site.site_payload["site"]["html_pipeline"]["context"][:emf_use_blocks]
        document.content = ExtendedMarkdownFilter.convert_curly_to_bracket(document.content)
      end
      old_run
    end
  end
end
