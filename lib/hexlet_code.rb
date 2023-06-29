# frozen_string_literal: true

module HexletCode
  autoload(:VERSION, 'hexlet_code/version.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  def self.form_for(entity, params = {}, &block)
    FormBuilder.build(entity, params, &block)
  end
end
