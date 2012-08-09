require 'yaml'

module Jekyll
  class IconsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @categories = YAML.load_file('icons.yml')
      @text = text
    end

    def render(context)
      html = ''
      html << "<ul id='icons'>"

      @categories.keys.sort.each do |category|
        html << "<h3 class='category'>#{category}</h3>"

        @categories[category].each do |entity|
          html << "<li data-entity='#{entity[0]}'>"
          html << "<div aria-hidden='true' data-icon='&#x#{entity[0]};'></div>"
          html << "<div class='description'>#{entity[1]}</div>"
          html << "</li>"
        end

      end

      html << "</ul>"

    end
  end
end

Liquid::Template.register_tag('icons', Jekyll::IconsTag)