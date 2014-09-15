module Filters
  module PostFilter
    def format_octicons!(html)
      html.gsub!(/#{Filters.front_wrap}\s*octicon-(\S+)\s*([^\\#{Filters.wrap_symbol}]+)\s*#{Filters.end_wrap}/, %|<span class="octicon \\1" aria-label="\\2" title="\\2"></span>|)
    end
  end
end

