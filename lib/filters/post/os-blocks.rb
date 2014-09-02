module Filters
  module PostFilter
    def format_os_blocks!(html)
      html.gsub!(/<p>#{Filters.front_wrap}\s*#mac\s*#{Filters.end_wrap}<\/p>/,     '<div class="platform-mac">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#windows\s*#{Filters.end_wrap}<\/p>/, '<div class="platform-windows">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#linux\s*#{Filters.end_wrap}<\/p>/,   '<div class="platform-linux">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*#all\s*#{Filters.end_wrap}<\/p>/,     '<div class="platform-all">')
      html.gsub!(/<p>#{Filters.front_wrap}\s*\/(mac|windows|linux|all)\s*#{Filters.end_wrap}<\/p>/, '</div>')
    end
  end
end
