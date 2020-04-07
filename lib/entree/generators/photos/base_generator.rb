# frozen_string_literal: true

module Jekyll

  module Paginate

    module Photos

      DEFAULT_TEMPLATE = 'photos.html'

      # BaseGenerator for Posts
      class BaseGenerator < ::Entree::PaginationGenerator

        private

        def configs
          @configs ||= site.config.dig(*(CONFIGS + %w[photos])) || {}
        end

        def photos
          @photos ||=
            site.collections['photos'].docs.
            reject { |x| x.data['hidden'].nil? || x.data['hidden'] }
        end

        def tags
          @tags ||=
            photos.map { |x| x.data['tags'] }.flatten.
            reject(&:nil?).uniq
        end

        def categories
          @categories ||=
            photos.map { |x| x.data['category'] }.
            reject(&:nil?).uniq
        end

        def years
          @years ||=
            photos.map { |x| x.data['date'] }.reject(&:nil?).
            map { |x| x.strftime('%Y') }.uniq
        end

        def folder
          @folder ||= configs.dig('index', 'dir')
        end

      end

    end

  end

end
