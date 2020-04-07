#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'jekyll'
require 'entree'

namespace :entree do
  desc 'Install and run all setup tasks'
  task :install do
    Rake::Task['entree:setup:forestry:setup'].invoke
    Rake::Task['entree:setup:data:setup'].invoke
    Rake::Task['entree:setup:pwa'].invoke
    Rake::Task['entree:setup:templates:index'].invoke
    Rake::Task['entree:setup:templates:404'].invoke
    Rake::Task['entree:setup:configs'].invoke
    Rake::Task['entree:setup:sass'].invoke
  end

  desc 'Remove Forestry.io Configs and Data Files'
  task :clean do
    Rake::Task['entree:setup:forestry:clean'].invoke
    Rake::Task['entree:setup:data:clean'].invoke
  end

  namespace :sample do
    desc 'Copy Sample Data'
    task :copy do
      cp_r gem_source('_posts'), '.'
      cp_r gem_source('_photos'), '.'
      cp_r gem_source('pages'), '.'
    end
  end

  namespace :setup do
    namespace :forestry do
      desc 'Copy Forestry.io Configs'
      task :setup do
        cp_r gem_source('.forestry'), '.'
      end

      desc 'Remove Forestry.io Configs'
      task :clean do
        rm_rf '.forestry'
      end
    end

    desc 'Copy Sass Variables'
    task :sass do
      Dir.mkdir('./_sass/variables') unless File.exist? './_sass/variables'
      theme = Jekyll.configuration({}).dig('entree', 'theme')

      # rubocop:disable Metrics/LineLength
      if theme.nil?
        cp_r gem_source('_sass/entree/variables/_vars.scss'),
             './_sass/variables/_vars.scss'
        cp_r gem_source('_sass/entree/variables/_bootstrap_vars.scss'),
             './_sass/variables/_bootstrap_vars.scss'
      else
        cp_r gem_source("_sass/entree/themes/#{theme}/variables/_vars.scss"),
             './_sass/variables/_vars.scss'
        cp_r gem_source("_sass/entree/themes/#{theme}/variables/_bootstrap_vars.scss"),
             './_sass/variables/_bootstrap_vars.scss'
        cp_r gem_source("_sass/entree/themes/#{theme}/variables/_theme.scss"),
             './_sass/variables/_theme.scss'
      end
      # rubocop:enable Metrics/LineLength
    end

    namespace :data do
      desc 'Copy Data Files'
      task :setup do
        cp_r gem_source('_data'), '.'
      end

      desc 'Remove Data Files'
      task :clean do
        rm_rf '_data'
      end
    end

    desc 'Copy PWA'
    task :pwa do
      cp_r gem_source('serviceworker.js'), '.'
      cp_r gem_source('manifest.json'), '.'
    end

    namespace :templates do
      desc 'Copy index'
      task 'index' do
        cp_r gem_source('index.html'), '.'
      end

      desc 'Copy 404'
      task '404' do
        cp_r gem_source('404.html'), '.'
      end
    end

    desc 'Copy Configs'
    task :configs do
      cp_r gem_source('_config.yml'), '.'
    end
  end

  def gem_source(path)
    File.join(Gem.loaded_specs['entree'].full_gem_path, path)
  end
end
