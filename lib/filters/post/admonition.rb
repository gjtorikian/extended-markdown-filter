module Filters
  module PostFilter
    def format_admonitions!(html)
      html.gsub!(/<p>#{Filters.front_wrap}\s*#tip\s*#{Filters.end_wrap}<\/p>/,     '<div class="alert tip">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#note\s*#{Filters.end_wrap}<\/p>/,    '<div class="alert note">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#warning\s*#{Filters.end_wrap}<\/p>/, '<div class="alert warning">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#danger\s*#{Filters.end_wrap}<\/p>/,   '<div class="alert danger">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*\/(tip|note|warning|danger)\s*#{Filters.end_wrap}<\/p>/, '</div>')
    end
  end
end
