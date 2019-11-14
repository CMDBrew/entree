# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = 'cmd-site'
  spec.version  = '0.1.0'
  spec.authors  = ['Nelson Lee']
  spec.email    = ['nelson@cmdbrew.com']

  spec.summary  = 'CMDBrew static site theme'
  spec.homepage = 'https://www.cmdbrew.com'
  spec.license  = 'CMDBrew Studio Inc.'

  spec.metadata['plugin_type'] = 'theme'

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(/^(assets|_layouts|_includes|_sass|LICENSE|README)/i)
  end

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'jekyll', '~> 4.0'
  spec.add_runtime_dependency 'jekyll-feed', '~> 0.9'
  spec.add_runtime_dependency 'jekyll-seo-tag', '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
end
