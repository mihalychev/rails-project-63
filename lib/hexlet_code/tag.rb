# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[area base br col command embed hr img input keygen link meta param source track wbr].freeze

    def self.build(tag, attributes = {})
      stringified_attributes = stringify_attributes(attributes)
      if SINGLE_TAGS.include?(tag)
        "<#{tag}#{stringified_attributes}>"
      else
        value = block_given? ? yield : ''
        "<#{tag}#{stringified_attributes}>#{value}</#{tag}>"
      end
    end

    def self.stringify_attributes(attributes)
      return '' if attributes.empty?

      attributes.map do |key, value|
        "#{key}=\"#{value}\""
      end.join(' ').insert(0, ' ')
    end
  end
end
