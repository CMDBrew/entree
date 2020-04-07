# frozen_string_literal: true

module Entree

  # Generates Category Page
  class CategoryGenerator < ::Entree::PageGenerator

    attr_accessor :category

    def initialize(*args)
      options = args.extract_options!
      @category = options.delete(:resource)
      super(options)
    end

    private

    def assign_page_data
      super
      data['title'] = category
      data['current'] = category
      data['current_scope'] = 'categories'
    end

  end

end
