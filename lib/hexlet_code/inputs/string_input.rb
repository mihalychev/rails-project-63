# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    class StringInput < BaseInput
      private

      def tag_name
        'input'
      end

      def input_attributes
        {
          type: @attributes[:type] || 'text',
          value: @entity.public_send(@field_name),
          **@attributes.except(:type)
        }
      end

      def input_value
        []
      end
    end
  end
end
