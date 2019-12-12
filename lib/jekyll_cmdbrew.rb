# frozen_string_literal: true

require 'byebug' if Jekyll.env.eql? 'development'
require 'jekyll'
require 'jekyll_cmdbrew/url_drop'
require 'jekyll_cmdbrew/category_generator'
require 'jekyll_cmdbrew/tag_generator'
require 'jekyll_cmdbrew/post_generator'
require 'jekyll_cmdbrew/collection_file_generator'
