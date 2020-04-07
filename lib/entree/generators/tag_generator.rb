# frozen_string_literal: true

module Entree

  # Generates Tag Page
  class TagGenerator < ::Entree::PageGenerator

    attr_accessor :tag

    def initialize(*args)
      options = args.extract_options!
      @tag = options.delete(:resource)
      super(options)
    end

    private

    def assign_page_data
      super
      data['title'] = tag
      data['current'] = tag
      data['current_scope'] = 'tags'
    end

  end

end
