module Filters
  module PostFilter
    MAC_HTML = '<div class="platform-mac">'
    WIN_HTML = '<div class="platform-windows">'
    LINUX_HTML = '<div class="platform-linux">'
    ALL_HTML = '<div class="platform-all">'

    def format_os_blocks!(html)
      html.gsub!(/<p>#{@front_wrap}#mac#{@end_wrap}<\/p>/,     MAC_HTML)
      html.gsub!(/<p>#{@front_wrap}#windows#{@end_wrap}<\/p>/, WIN_HTML)
      html.gsub!(/<p>#{@front_wrap}#linux#{@end_wrap}<\/p>/,   LINUX_HTML)
      html.gsub!(/<p>#{@front_wrap}#all#{@end_wrap}<\/p>/,     ALL_HTML)
      html.gsub!(/<p>#{@front_wrap}\/(mac|windows|linux|all)#{@end_wrap}<\/p>/, Filters::CLOSE_DIV)
    end
  end
end
