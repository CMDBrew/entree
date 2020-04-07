# frozen_string_literal: true

module Jekyll

  module Paginate

    module Pages

      module Categories

        # Paginiate collection
        class Pagination < BaseGenerator

          def generate(site)
            super(site)

            categories.each do |category|
              dir = File.join(folder, Utils.slugify(category))
              collection =
                pages.select { |x| x.data['category'] == category }
              create_pages(collection: collection, dir: dir,
                           resource: category, klass: IndexPage)
            end
          end

          private

          def folder
            @folder ||= configs.dig('categories', 'dir')
          end

        end

        # Create pages
        class IndexPage < ::Entree::CategoryGenerator

          private

          def layout
            site.config.dig('generators', 'pages', 'categories', 'layout') ||
              DEFAULT_TEMPLATE
          end

        end

      end

    end

  end

end
