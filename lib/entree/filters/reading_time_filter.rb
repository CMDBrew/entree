# frozen_string_literal: true

# Outputs the reading time
# Usage: Read this in about {{ page.content | reading_time }}

# Returns Reading time in minutes
module ReadingTimeFilter

  WORDS_PER_MINUTE = 180

  def reading_time(input)
    words = input.split.size
    (words.to_f / WORDS_PER_MINUTE).ceil
  end

end

Liquid::Template.register_filter(ReadingTimeFilter)
