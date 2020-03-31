# frozen_string_literal: true

# Outputs the reading time
# Usage: Read this in about {{ page.content | reading_time }}

# Returns Reading time in minutes
module ReadingTimeFilter

  WORDS_PER_MINUTE = 180

  def reading_time(input)
    words = input.split.size
    (words / WORDS_PER_MINUTE).floor
  end

end

Liquid::Template.register_filter(ReadingTimeFilter)
