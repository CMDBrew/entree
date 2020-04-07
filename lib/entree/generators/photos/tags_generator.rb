# frozen_string_literal: true

module Jekyll

  module Paginate

    module Photos

      module Tags

        # Paginiate collection
        class Pagination < BaseGenerator

          def generate(site)
            super(site)

            tags.each do |tag|
              dir = File.join(folder, Utils.slugify(tag))
              collection =
                photos.select { |x| x.data['tags'].to_a.include?(tag) }
              create_pages(collection: collection, dir: dir,
                           resource: tag, klass: IndexPage)
            end
          end

          private

          def folder
            @folder ||= configs.dig('tags', 'dir')
          end

        end

        # Create pages
        class IndexPage < ::Entree::TagGenerator

          private

          def layout
            site.config.dig('generators', 'photos', 'tags', 'layout') ||
              DEFAULT_TEMPLATE
          end

        end

      end

    end

  end

end
