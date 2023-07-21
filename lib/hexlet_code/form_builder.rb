# frozen_string_literal: true

module HexletCode
  autoload(:Inputs, 'hexlet_code/inputs.rb')

  class FormBuilder
    def initialize(
      entity,
      params,
      text_input = Inputs::TextInput,
      string_input = Inputs::StringInput,
      submit_input = Inputs::SubmitInput
    )
      @entity = entity
      @params = params
      @text_input = text_input
      @string_input = string_input
      @submit_input = submit_input
    end

    def input(field_name, attributes = {})
      as = attributes[:as] == :text ? 'text' : 'string'
      input = instance_variable_get("@#{as}_input")
      form_structure[:value] += input.new(
        @entity, field_name, attributes
      ).structure
    end

    def submit(value = 'Save', attributes = {})
      form_structure[:value] << @submit_input.new(value, attributes).structure
    end

    def form_structure
      @form_structure ||= {
        name: 'form',
        attributes: {
          action: @params[:url] || '/',
          method: @params[:method] || 'post',
          **@params.except(:url, :method)
        },
        value: []
      }
    end
  end
end
