# frozen_string_literal: true

module HexletCode
  autoload(:VERSION, 'hexlet_code/version.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:Renderer, 'hexlet_code/renderer.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')

  def self.form_for(entity, params = {})
    builder = FormBuilder.new(entity, params)
    yield builder if block_given?
    Renderer.render(builder.form_structure)
  end
end
