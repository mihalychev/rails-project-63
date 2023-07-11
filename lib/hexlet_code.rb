# frozen_string_literal: true

require 'dry-initializer'

module HexletCode
  autoload(:VERSION, 'hexlet_code/version.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:Renderer, 'hexlet_code/renderer.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:InputBuilder, 'hexlet_code/input_builder.rb')
  autoload(:TextareaBuilder, 'hexlet_code/textarea_builder.rb')
  autoload(:SubmitBuilder, 'hexlet_code/submit_builder.rb')

  def self.form_for(entity, params = {})
    builder = FormBuilder.new(entity, params)
    yield builder if block_given?

    form_structure = builder.build
    Renderer.render(form_structure)
  end
end
