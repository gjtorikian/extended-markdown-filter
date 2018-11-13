module Filters
  module PostFilter
    def format_octicons!(html)
      html.gsub!(/#{@front_wrap}\s*octicon-(\S+)\s*([^\\#{@wrap_symbol}]+)\s*#{@end_wrap}/, %|<span class="octicon octicon-\\1" aria-label="\\2" title="\\2"></span>|)
    end
  end
end
