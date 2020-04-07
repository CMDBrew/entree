# frozen_string_literal: true

# Filter content from HTML
module HtmlFilter

  def first_img_src(content, ext)
    return if content.nil?

    html = ext.eql?('.md') ? markdownify(content) : content
    doc = Nokogiri(html)
    img = doc.search('img').first
    return if img.nil?

    img.attr('src').split('?').first
  end

  def cover_img(resource, key = 'banner')
    if resource[key].to_s.empty?
      first_img_src(resource.content, resource['ext'])
    else
      resource[key]
    end
  end

end

Liquid::Template.register_filter(HtmlFilter)
