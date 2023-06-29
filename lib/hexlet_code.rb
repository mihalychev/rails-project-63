# frozen_string_literal: true

require_relative 'hexlet_code/tags/tag'
require_relative 'hexlet_code/tags/html_tag'

module HexletCode
  autoload(:VERSION, 'hexlet_code/version.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  def self.form_for(entity, params = {}, &block)
    FormBuilder.build(entity, params, &block)
  end
end
