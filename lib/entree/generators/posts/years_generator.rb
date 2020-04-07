# frozen_string_literal: true

module Jekyll

  module Paginate

    module Posts

      module Years

        # Paginiate collection
        class Pagination < BaseGenerator

          def generate(site)
            super(site)

            years.each do |year|
              dir = File.join(folder, Utils.slugify(year))
              collection =
                posts.select { |x| x.date.strftime('%Y') == year }
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
            site.config.dig('generators', 'posts', 'years', 'layout') ||
              DEFAULT_TEMPLATE
          end

        end

      end

    end

  end

end
