# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :structure

      def initialize(entity, field_name, attributes)
        @entity = entity
        @field_name = field_name
        @attributes = attributes

        @structure = [
          {
            name: 'label',
            attributes: {
              for: @field_name.to_s
            },
            value: [@field_name.to_s.capitalize]
          },
          {
            name: tag_name,
            attributes: {
              name: @field_name,
              **input_attributes
            },
            value: [input_value]
          }
        ]
      end

      private

      def tag_name
        raise NotImplementedError
      end

      def input_attributes
        raise NotImplementedError
      end

      def input_value
        @entity.public_send(@field_name)
      end
    end
  end
end
