module Filters
  module PostFilter
    def format_intro!(html)
      html.gsub!(/<p>#{Filters.front_wrap}\s*#intro\s*#{Filters.end_wrap}<\/p>/,    '<div class="intro">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*\/intro\s*#{Filters.end_wrap}<\/p>/,   '</div>')
    end
  end
end
