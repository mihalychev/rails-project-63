# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    class TextInput < BaseInput
      private

      def tag_name
        'textarea'
      end

      def input_attributes
        {
          cols: @attributes[:cols] || 20,
          rows: @attributes[:rows] || 40,
          **@attributes.except(:as, :cols, :rows)
        }
      end
    end
  end
end
