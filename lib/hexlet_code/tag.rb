# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[area base br col command embed hr img input keygen link meta param source track wbr].freeze

    class << self
      def build(tag, attributes, &block)
        new(tag, attributes).build(&block)
      end
    end

    def initialize(tag, attributes)
      @tag = tag
      @attributes = attributes
    end

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
