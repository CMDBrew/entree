# frozen_string_literal: true

module Jekyll

  module Paginate

    module Category

      # Paginiate collection
      class Pagination < Generator

        safe true
        priority :lowest

        def generate(site)
          dir = site.config['category_dir'] || 'categories'

          site.categories.each do |category, posts|
            folder = File.join(dir, category)
            create_pages(site, posts, folder, category)
          end
        end

        private

        def create_pages(site, posts, folder, category)
          if Paginate::Pager.pagination_enabled?(site)
            total =
              Paginate::Pager.calculate_pages(posts, site.config['paginate'])
            (1..total).each do |i|
              site.pages <<
                IndexPage.new(site, site.source, folder, category, i)
            end
          else
            site.pages << IndexPage.new(site, site.source, folder, category)
          end
        end

      end

      # Create pages
      class IndexPage < Page

        def initialize(site, base, dir, category, num_page = nil)
          @site = site
          @base = base
          @dir  = dir
          @name = html_filename(site, num_page, name: '')
          layout = site.config['category_layout'] || 'category.html'

          process(@name)
          read_yaml(File.join(@base, '_layouts'), layout)
          assign_page_data(site, num_page, category)
        end

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

        def assign_page_data(site, num_page, category)
          if Paginate::Pager.pagination_enabled?(site)
            data['paginator'] =
              Paginate::Pager.new(site, num_page, site.categories[category])
          end

          data['title'] = category
          data['category'] = category
        end

      end

    end

  end

end
