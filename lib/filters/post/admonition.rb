module Filters
  module PostFilter
    TIP_HTML = '<div class="alert tip">'
    NOTE_HTML = '<div class="alert note">'
    WARNING_HTML = '<div class="alert warning">'
    DANGER_HTML = '<div class="alert danger">'

    def format_admonitions!(html)
      html.gsub!(/<p>#{@front_wrap}#tip#{@end_wrap}<\/p>/,     TIP_HTML)
      html.gsub!(/<p>#{@front_wrap}#note#{@end_wrap}<\/p>/,    NOTE_HTML)
      html.gsub!(/<p>#{@front_wrap}#warning#{@end_wrap}<\/p>/, WARNING_HTML)
      html.gsub!(/<p>#{@front_wrap}#danger#{@end_wrap}<\/p>/,  DANGER_HTML)
      html.gsub!(/<p>#{@front_wrap}\/(tip|note|warning|danger)#{@end_wrap}<\/p>/, Filters::CLOSE_DIV)
    end
  end
end
