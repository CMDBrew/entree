# frozen_string_literal: true

module Entree

  # Generates Year Page
  class YearGenerator < ::Entree::PageGenerator

    attr_accessor :year

    def initialize(*args)
      options = args.extract_options!
      @year = options.delete(:resource)
      super(options)
    end

    private

    def assign_page_data
      super
      data['title'] = year
      data['current'] = year
      data['current_scope'] = 'years'
    end

  end

end
