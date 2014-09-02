module Filters
  module PostFilter
    def format_admonition!(html)
      html.gsub!(/<p>#{Filters.front_wrap}\s*#tip\s*#{Filters.end_wrap}<\/p>/,     '<div class="alert tip">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#warning\s*#{Filters.end_wrap}<\/p>/, '<div class="alert warning">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#error\s*#{Filters.end_wrap}<\/p>/,   '<div class="alert error">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*\/(tip|warning|error)\s*#{Filters.end_wrap}<\/p>/, '</div>')
    end
  end
end
