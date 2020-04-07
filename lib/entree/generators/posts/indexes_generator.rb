# frozen_string_literal: true

module Jekyll

  module Paginate

    module Posts

      module Indexes

        # Paginiate collection
        class Pagination < BaseGenerator

          def generate(site)
            super(site)
            create_pages(collection: posts, dir: folder, klass: IndexPage)
          end

        end

        # Create pages
        class IndexPage < ::Entree::PageGenerator

          private

          def layout
            site.config.dig('generators', 'posts', 'index', 'layout') ||
              DEFAULT_TEMPLATE
          end

        end

      end

    end

  end

end
