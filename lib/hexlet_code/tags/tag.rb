# frozen_string_literal: true

module HexletCode
  module Tags
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
        raise NotImplementedError
      end
    end
  end
end
