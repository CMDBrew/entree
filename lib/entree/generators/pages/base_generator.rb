# frozen_string_literal: true

module Jekyll

  module Paginate

    module Pages

      DEFAULT_TEMPLATE = 'pages.html'

      # BaseGenerator for Posts
      class BaseGenerator < ::Entree::PaginationGenerator

        private

        def configs
          @configs ||= site.config.dig(*(CONFIGS + %w[pages])) || {}
        end

        def pages
          @pages ||=
            site.pages.reject { |x| x.data['hidden'].nil? || x.data['hidden'] }&.
            sort_by { |x| (x.data['title'] || x.name.to_s) }
        end

        def tags
          @tags ||=
            pages.map { |x| x.data['tags'] }.flatten.
            reject(&:nil?).uniq
        end

        def categories
          @categories ||=
            pages.map { |x| x.data['category'] }.
            reject(&:nil?).uniq
        end

        def folder
          @folder ||= configs.dig('index', 'dir')
        end

      end

    end

  end

end
