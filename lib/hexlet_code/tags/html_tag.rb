# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  module Tags
    class HtmlTag < Tag
      def build(&block)
        stringified_attributes = stringify_attributes(@attributes)
        if SINGLE_TAGS.include?(@tag)
          "<#{@tag}#{stringified_attributes}>"
        else
          value = block&.call || ''
          "<#{@tag}#{stringified_attributes}>#{value}</#{@tag}>"
        end
      end

      private

      def stringify_attributes(attributes)
        return '' if attributes.empty?

        attributes.map do |key, value|
          "#{key}=\"#{value}\""
        end.join(' ').insert(0, ' ')
      end
    end
  end
end
