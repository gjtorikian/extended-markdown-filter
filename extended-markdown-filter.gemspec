Gem::Specification.new do |spec|
  spec.name          = 'extended-markdown-filter'
  spec.version       = '0.7.0'
  spec.authors       = ['Garen Torikian']
  spec.email         = ['gjtorikian@gmail.com']
  spec.summary       = %q{Add extended markup syntax to the HTML::Pipeline}
  spec.description   = %q{This is a custom Markdown processor to be used with GitHub's HTML::Pipeline. }
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'html-pipeline', '~> 2.9'

  spec.add_development_dependency 'bundler', '~> 1.4'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'commonmarker', '~> 0.18'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'rubocop-github', '~> 0.12'
end
