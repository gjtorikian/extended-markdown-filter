module Filters
  CLOSE_DIV = '</div>'
end

Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'pre', '*.rb')].each do |file|
  require file
end

Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'post', '*.rb')].each do |file|
  require file
end
