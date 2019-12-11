# frozen_string_literal: true

# Overwiret UrlDrop - lib/jekyll/drops/url_drop.rb
module Jekyll

  module Drops

    # Slugify category for multi-word categories
    class UrlDrop < Drop

      def categories
        category_set = Set.new
        Array(@obj.data['categories']).each do |category|
          category_set << Utils.slugify(category.to_s)
        end
        category_set.to_a.join('/')
      end

    end

  end

end
