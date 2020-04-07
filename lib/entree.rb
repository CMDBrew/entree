# frozen_string_literal: true

# Require Gems
require 'byebug' if Jekyll.env.eql? 'development'
require 'jekyll'
require 'nokogiri'

# Require Extensions
require 'entree/extensions/array'
require 'entree/extensions/url_drop'

# Require Generators
require 'entree/generators/page_generator'
require 'entree/generators/category_generator'
require 'entree/generators/year_generator'
require 'entree/generators/tag_generator'
require 'entree/generators/pagination_generator'
## Pages
require 'entree/generators/pages/base_generator'
require 'entree/generators/pages/indexes_generator'
require 'entree/generators/pages/categories_generator'
require 'entree/generators/pages/tags_generator'
## Posts
require 'entree/generators/posts/base_generator'
require 'entree/generators/posts/indexes_generator'
require 'entree/generators/posts/categories_generator'
require 'entree/generators/posts/tags_generator'
require 'entree/generators/posts/years_generator'
## Photos
require 'entree/generators/photos/base_generator'
require 'entree/generators/photos/indexes_generator'
require 'entree/generators/photos/categories_generator'
require 'entree/generators/photos/tags_generator'
require 'entree/generators/photos/years_generator'

# Require Filters
require 'entree/filters/reading_time_filter'
require 'entree/filters/ternary_filter'
require 'entree/filters/array_map_filter'
require 'entree/filters/html_filter'
