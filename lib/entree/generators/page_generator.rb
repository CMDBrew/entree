# frozen_string_literal: true

module Entree

  # Generates Page
  class PageGenerator < ::Jekyll::Page

    attr_reader :site, :collection, :num_page, :dir

    def initialize(site:, dir:, collection:, num_page: nil)
      @site = site
      @base = site.source
      @dir  = dir
      @num_page = num_page
      @collection = collection
      ##
      # Path is only used by the convertible module and accessed below when
      # calling read_yaml
      # Handling themes stored in a gem
      @path = template_path(@base)
      process(template_name)
      read_yaml(File.join(@base, '_layouts'), layout)
      assign_page_data
    end

    private

    def layout
      site.config['posts_layout'] || 'posts.html'
    end

    def template_path(base)
      if File.exist? site.in_source_dir(base, '_layouts', layout)
        site.in_source_dir('_layouts', layout)
      else
        site.in_theme_dir('_layouts', layout)
      end
    end

    def template
      '/:path/:basename:output_ext'
    end

    def template_name
      name = ::Jekyll::Paginate::Pager.paginate_path(site, num_page) || ''
      name.concat '/' unless name.end_with? '/'
      name + 'index.html'
    end

    def assign_page_data
      data['dir'] = dir
      data['paginator'] =
        ::Jekyll::Paginate::Pager.new(site, num_page, collection)
    end

  end

end
