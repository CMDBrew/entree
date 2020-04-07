# frozen_string_literal: true

# Extends Array
class Array

  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end

end
