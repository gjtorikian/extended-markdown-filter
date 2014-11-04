module Filters
  module PreFilter
    def format_command_line!(text)
      text.gsub! /((`{3}\s*)(command-line)?(\s*([\w\W]+?)\n*)\2)\n*(?:[^\S\w\s]|$)/m do |block|
        str = $5.dup
        return block unless str.lines.to_a[0].chomp == "command-line"
        str = str.lines.to_a[1..-1].join

        block.gsub! /``` command-line/, '<pre class="command-line">'
        block.gsub! /```/, "</pre>\n"
        block.gsub!(/^\$ (.+)$/) { %Q|<span class="command">#{$1.rstrip}</span>| }
        block.gsub!(/^(\# .+)$/) { %Q|<span class="comment">#{$1.rstrip}</span>| }
        block.gsub!(/^> (.+)$/) { %Q|<span class="output"><span># </span>#{$1.rstrip}</span>| }

        block
      end
    end
  end
end
