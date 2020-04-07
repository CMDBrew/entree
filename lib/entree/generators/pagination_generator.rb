# frozen_string_literal: true

module Entree

  # Pagination
  class PaginationGenerator < ::Jekyll::Generator

    CONFIGS = %w[entree generators].freeze

    safe true
    priority :lowest

    attr_reader :site

    def generate(site)
      @site = site
    end

    private

    def create_pages(*args)
      options = args.extract_options!
      klass = options.delete(:klass)
      total =
        ::Jekyll::Paginate::Pager.
        calculate_pages(options[:collection], site.config['paginate'])
      (1..total).each do |i|
        site.pages << klass.new(options.merge(site: site, num_page: i))
      end
    end

  end

end
