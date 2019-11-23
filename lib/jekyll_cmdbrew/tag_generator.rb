# frozen_string_literal: true

module Jekyll

  module Paginate

    module Tag

      # Paginiate collection
      class Pagination < Generator

        safe true
        priority :lowest

        def generate(site)
          dir = site.config['tag_dir'] || 'tags'

          site.tags.each do |tag, posts|
            folder = File.join(dir, tag)
            create_pages(site, posts, folder, tag)
          end
        end

        private

        def create_pages(site, posts, folder, tag)
          if Paginate::Pager.pagination_enabled?(site)
            total =
              Paginate::Pager.calculate_pages(posts, site.config['paginate'])
            (1..total).each do |i|
              site.pages <<
                IndexPage.new(site, site.source, folder, tag, i)
            end
          else
            site.pages << IndexPage.new(site, site.source, folder, tag)
          end
        end

      end

      # Create pages
      class IndexPage < Page

        # rubocop:disable Metrics/MethodLength
        def initialize(site, base, dir, tag, num_page = nil)
          @site = site
          @base = base
          @dir  = dir
          @name = html_filename(site, num_page, name: '')
          layout = site.config['tag_layout'] || 'tag.html'
          # Path is only used by the convertible module and accessed below when calling read_yaml
          # Handling themes stored in a gem
          @path =
            if File.exist? site.in_source_dir(base, '_layouts', layout)
              site.in_source_dir('_layouts', layout)
            else
              site.in_theme_dir('_layouts', layout)
            end

          process(@name)
          read_yaml(File.join(@base, '_layouts'), layout)
          assign_page_data(site, num_page, tag)
        end
        # rubocop:enable Metrics/MethodLength

        def template
          '/:path/:basename:output_ext'
        end

        private

        def html_filename(site, num_page, name: '')
          if Paginate::Pager.pagination_enabled?(site)
            name = Paginate::Pager.paginate_path(site, num_page)
            name.concat '/' unless name.end_with? '/'
          end

          name + 'index.html'
        end

        def assign_page_data(site, num_page, tag)
          if Paginate::Pager.pagination_enabled?(site)
            data['paginator'] =
              Paginate::Pager.new(site, num_page, site.tags[tag])
          end

          data['title'] = tag
          data['tag'] = tag
        end

      end

    end

  end

end
