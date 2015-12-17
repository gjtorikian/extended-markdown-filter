module Filters
  module PreFilter
    def format_helper(text)
      prefix = '<p'

      text.gsub /\n?``` helper(.+?)```/m do |block|
        block.gsub! /^``` helper/, ''
        block.gsub! /^```$/, ''

        header = ''
        block.gsub! /^#### (.+?)$/ do
          header = $1.strip
          ''
        end

        content = block.strip
        content = "<p>#{content}</p>" unless content[0, prefix.length] == prefix
        content = "<div class='helper'><h4 class='header'><a href='#'>#{header}</a></h4><div class='content'>#{content}</div></div>"
      end
    end
  end
end
