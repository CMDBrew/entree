module Jekyll

  module Paginate

    module Post

      # Paginiate collection
      class Pagination < Generator

        safe true
        priority :lowest

        def generate(site)
          folder = site.config['post_dir'] || 'posts'

          create_pages(site, site.posts, folder)
        end

        private

        def create_pages(site, posts, folder)
          if Paginate::Pager.pagination_enabled?(site)
            total =
              Paginate::Pager.calculate_pages(posts, site.config['paginate'])
            (1..total).each do |i|
              site.pages << IndexPage.new(site, site.source, folder, i)
            end
          else
            site.pages << IndexPage.new(site, site.source, folder)
          end
        end

      end

      # Create pages
      class IndexPage < Page

        # rubocop:disable Metrics/MethodLength
        def initialize(site, base, dir, num_page = nil)
          @site = site
          @base = base
          @dir  = dir
          @name = html_filename(site, num_page, name: '')
          layout = site.config['post_layout'] || 'posts.html'
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
          assign_page_data(site, num_page)
        end
        # rubocop:enable Metrics/MethodLength

        def template
          '/:path/:basename:output_ext'
        end

        private

        def html_filename(site, num_page, name: '')
          if Paginate::Pager.pagination_enabled?(site)
            name = Paginate::Pager.paginate_path(site, num_page) || ''
            name.concat '/' unless name.end_with? '/'
          end

          name + 'index.html'
        end

        def assign_page_data(site, num_page)
          return unless Paginate::Pager.pagination_enabled?(site)

          posts = site.posts.docs.sort { |a, b| b <=> a }
          data['paginator'] = Paginate::Pager.new(site, num_page, posts)
        end

      end

    end

  end

end
