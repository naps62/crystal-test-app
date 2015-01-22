struct HTML::Builder
  def link(attrs = nil : Hash?)
    @str << "<link"
    if attrs
      @str << " "
      attrs.each do |name, value|
        @str << name
        @str << %(=")
        @str << value
        @str << %(")
      end
    end
    @str << ">"
    with self yield self
    @str << "</link>"
  end
end
