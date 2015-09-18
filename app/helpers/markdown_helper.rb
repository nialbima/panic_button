module MarkdownHelper

  def markdown(text, options={})
    options = {
      # add all attributes here
      link_attribute: { rel:'nofollow', target: "_blank" },
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, options)

    markdown.render(text).html_safe
  end

end
