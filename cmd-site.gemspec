# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = 'cmd-site'
  spec.version  = '0.1.0'
  spec.authors  = ['Nelson Lee']
  spec.email    = ['nelson@cmdbrew.com']

  spec.summary  = 'CMDBrew static site theme'
  spec.homepage = 'https://www.cmdbrew.com'
  spec.license  = 'CMDBrew Studio Inc.'

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(/^(assets|_layouts|_includes|_sass|LICENSE|README)/i)
  end

  spec.add_runtime_dependency 'jekyll', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.0'
end
