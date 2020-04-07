# frozen_string_literal: true

module Jekyll

  module Paginate

    module Photos

      module Years

        # Paginiate collection
        class Pagination < BaseGenerator

          def generate(site)
            super(site)

            years.each do |year|
              dir = File.join(folder, Utils.slugify(year))
              collection =
                photos.select do |x|
                  x.data['date']&.strftime('%Y') == year
                end
              create_pages(collection: collection,
                           dir: dir, resource: year, klass: IndexPage)
            end
          end

          private

          def folder
            @folder ||= configs.dig('years', 'dir')
          end

        end

        # Create pages
        class IndexPage < ::Entree::YearGenerator

          private

          def layout
            site.config.dig('generators', 'photos', 'years', 'layout') ||
              DEFAULT_TEMPLATE
          end

        end

      end

    end

  end

end
