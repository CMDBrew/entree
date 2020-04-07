# frozen_string_literal: true

module Jekyll

  module Paginate

    module Posts

      DEFAULT_TEMPLATE = 'posts.html'

      # BaseGenerator for Posts
      class BaseGenerator < ::Entree::PaginationGenerator

        private

        def configs
          @configs ||= site.config.dig(*(CONFIGS + %w[posts])) || {}
        end

        def posts
          @posts ||=
            site.posts.docs.
            reject { |x| x.data['hidden'].nil? || x.data['hidden'] }.reverse
        end

        def tags
          @tags ||=
            posts.map { |x| x.data['tags'] }.flatten.
            reject(&:nil?).uniq
        end

        def categories
          @categories ||=
            posts.map { |x| x.data['category'] }.
            reject(&:nil?).uniq
        end

        def years
          @years ||= posts.map { |x| x.date.strftime('%Y') }.uniq
        end

        def folder
          @folder ||= configs.dig('index', 'dir')
        end

      end

    end

  end

end
