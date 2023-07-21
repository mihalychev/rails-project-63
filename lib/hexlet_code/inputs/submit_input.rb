# frozen_string_literal: true

module HexletCode
  module Inputs
    class SubmitInput
      attr_reader :structure

      def initialize(value, attributes)
        @structure = {
          name: 'input',
          attributes: {
            type: 'submit',
            value:,
            **attributes.except(:type, :value)
          }
        }
      end
    end
  end
end
