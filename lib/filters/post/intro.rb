module Filters
  module PostFilter
    INTRO_HTML = '<div class="intro">'
    CLOSE_DIV = '</div>'

    def format_intro!(html)
      html.gsub!(/<p>#{@front_wrap}#intro#{@end_wrap}<\/p>/,    INTRO_HTML)
      html.gsub!(/<p>#{@front_wrap}\/intro#{@end_wrap}<\/p>/,   CLOSE_DIV)
    end
  end
end
