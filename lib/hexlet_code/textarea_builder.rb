# frozen_string_literal: true

module HexletCode
  class TextareaBuilder
    extend Dry::Initializer

    param :entity
    param :field_name
    param :attributes

    def self.build(entity, field_name, attributes)
      new(entity, field_name, attributes).build
    end

    def build
      [
        build_label,
        build_textarea
      ]
    end

    private

    def build_label
      {
        name: 'label',
        attributes: {
          for: field_name
        },
        value: [field_name.capitalize]
      }
    end

    def build_textarea
      {
        name: 'textarea',
        attributes: {
          name: field_name,
          type: attributes[:type] || 'text',
          cols: attributes[:cols] || 20,
          rows: attributes[:rows] || 40,
          **attributes.except(:as, :type, :cols, :rows)
        },
        value: [entity.public_send(field_name)]
      }
    end
  end
end
