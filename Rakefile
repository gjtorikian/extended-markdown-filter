require 'bundler/gem_tasks'

task default: [:test]

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
