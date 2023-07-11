# frozen_string_literal: true

module HexletCode
  class SubmitBuilder
    extend Dry::Initializer

    param :entity
    param :value
    param :attributes

    def build
      {
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
