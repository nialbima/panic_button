class Compliment < ActiveRecord::Base


    # validations

    def markdown
        Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

end
