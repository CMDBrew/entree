# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_cmdbrew/version'

Gem::Specification.new do |spec|
  spec.name     = 'jekyll_cmdbrew'
  spec.version  = Jekyll::CMDBrew::VERSION
  spec.authors  = ['Nelson Lee']
  spec.email    = ['nelson@cmdbrew.com']
  spec.summary  = 'CMDBrew headless site theme'
  spec.homepage = 'https://www.cmdbrew.com'
  spec.license  = 'CMDBrew Studio Inc.'

  spec.files =
    `git ls-files -z`.split("\x0").select do |f|
      f.match(/^(assets|_layouts|_includes|_sass|_plugins|_data|LICENSE|README)/i)
    end

  spec.require_paths = %w[lib]
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
