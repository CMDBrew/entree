# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = 'jekyll-cmdbrew'
  spec.version  = '0.1.0'
  spec.authors  = ['Nelson Lee']
  spec.email    = ['nelson@cmdbrew.com']
  spec.summary  = 'CMDBrew headless site theme'
  spec.homepage = 'https://www.cmdbrew.com'
  spec.license  = 'CMDBrew Studio Inc.'

  spec.files = Dir['{assets,_layouts,_includes,_sass,_plugins,_data}/**/*', 'LICENSE', 'README']

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'jekyll', '~> 4.0'
  spec.add_runtime_dependency 'jekyll-feed', '~> 0.9'
  spec.add_runtime_dependency 'jekyll-paginate', '~> 1.1'
  spec.add_runtime_dependency 'jekyll-seo-tag', '~> 2.1'
  spec.add_runtime_dependency 'jekyll-tagging-related_posts', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'inch', '~> 0.8.0'
  spec.add_development_dependency 'license_finder', '~> 5.10.2'
  spec.add_development_dependency 'rake', '~> 12.0'
end
