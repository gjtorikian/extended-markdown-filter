module Filters
  module PostFilter
    def format_command_line!(html)
      html.gsub!(/<pre><code>``` command-line\n/, "<pre class=\"command-line\">\n")
      html.gsub!(/<pre lang="command-line">/, "<pre class=\"command-line\">\n")

      html.gsub! /^\n?\s*<pre class="command-line">(.+?)<\/pre>/m do |block|
        block.gsub!(/<\/*code>/, '')
        block.gsub!(/```/, '')
        block.gsub!(/^\s*\$ (.+)$/) { %(<span class="command">#{$1.rstrip}</span>) }
        block.gsub!(/^\s*(\# .+)$/) { %(<span class="comment">#{$1.rstrip}</span>) }
        block.gsub!(/^\s*&gt; (.+)$/) { %(<span class="output">#{$1.rstrip}</span>) }
        block.gsub!(/&lt;/, '<')
        block.gsub!(/&gt;/, '>')

        block
      end
    end
  end
end
