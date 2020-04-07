# frozen_string_literal: true

# Outputs the true or false value
# Usage: {{ page.slug | matches: 'tags', 'active', 'inactive' }}

# Returns true or false output based on condition
module TernaryFilters

  def matches(value, matcher, true_output, untrue_output = '')
    value == matcher ? true_output : untrue_output
  end

  def includes(value, matcher, true_output, untrue_output = '')
    value.include?(matcher) ? true_output : untrue_output
  end

end

Liquid::Template.register_filter(TernaryFilters)
