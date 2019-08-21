# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minerva_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'minerva_api'
  spec.version       = MinervaApi::VERSION
  spec.authors       = ['luigi russo']
  spec.email         = ['russo.1699981@studenti.uniroma1.it']

  spec.summary       = 'Simple gem to get infos about Open-Access papers'
  spec.description   = ''
  spec.homepage      = 'https://www.github.com/lrusso96/minerva_api'
  spec.license       = 'GPL-3'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '>= 1.10.4'
  spec.add_runtime_dependency 'full-name-splitter', '~> 0.1.2'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
