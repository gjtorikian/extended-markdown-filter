module Filters
  module PostFilter
    INTRO_HTML = '<div class="intro">'

    def format_intro!(html)
      html.gsub!(/<p>#{@front_wrap}#intro#{@end_wrap}<\/p>/,    INTRO_HTML)
      html.gsub!(/<p>#{@front_wrap}\/intro#{@end_wrap}<\/p>/,   Filters::CLOSE_DIV)
    end
  end
end
