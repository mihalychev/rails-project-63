# frozen_string_literal: true

module HexletCode
  class InputBuilder
    extend Dry::Initializer

    param :entity
    param :field_name
    param :attributes

    def build
      [
        build_label,
        build_input
      ]
    end

    private

    def build_label
      {
        name: 'label',
        attributes: {
          for: field_name.to_s
        },
        value: [field_name.to_s.capitalize]
      }
    end

    def build_input
      {
        name: 'input',
        attributes: {
          name: field_name,
          type: attributes[:type] || 'text',
          value: entity.public_send(field_name),
          **attributes.except(:type)
        }
      }
    end
  end
end
