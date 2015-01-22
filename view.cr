require "html/builder"

class View
  def render(locals)
    HTML::Builder.new.build do
      html do
        head do
          title { text "GB Pull Requests" }
        end
        body do
          locals["items"].each do |item|
            div do
              p { text item }
            end
          end
        end
      end
    end
  end
end


