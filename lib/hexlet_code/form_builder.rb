# frozen_string_literal: true

module HexletCode
  class FormBuilder
    extend Dry::Initializer

    param :entity
    param :params

    option :input_builder, default: -> { InputBuilder }
    option :textarea_builder, default: -> { TextareaBuilder }
    option :submit_builder, default: -> { SubmitBuilder }

    def build
      form_structure
    end

    def input(field_name, attributes = {})
      if attributes[:as] == :text
        textarea = textarea_builder.new(entity, field_name, attributes)
        form_structure[:value] += textarea.build
      else
        input = input_builder.new(entity, field_name, attributes)
        form_structure[:value] += input.build
      end
    end

    def submit(value = 'Save', attributes = {})
      submit = submit_builder.new(entity, value, attributes)
      form_structure[:value] << submit.build
    end

    private

    def form_structure
      @form_structure ||= {
        name: 'form',
        attributes: {
          action: params[:url] || '/',
          method: params[:method] || 'post',
          **params.except(:url, :method)
        },
        value: []
      }
    end
  end
end
