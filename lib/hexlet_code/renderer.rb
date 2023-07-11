# frozen_string_literal: true

module HexletCode
  class Renderer
    def self.render(form_structure)
      Tag.build(
        form_structure[:name],
        form_structure[:attributes]
      ) do
        form_structure[:value].map do |element|
          element.is_a?(Hash) ? render(element) : element
        end.join
      end
    end
  end
end
