# frozen_string_literal: true

# Outputs the time formatted array
# Usage: Posts in years {{ posts | map: 'date' | arr_strftime: '%Y' }}

# Returns time formatted array
module ArrayMapFilter

  def map_strftime(arr, format)
    arr.reject(&:nil?).map { |x| x.strftime(format) }
  end

end

Liquid::Template.register_filter(ArrayMapFilter)
