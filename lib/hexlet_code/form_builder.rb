# frozen_string_literal: true

module HexletCode
  class FormBuilder
    class << self
      def build(entity, params, &block)
        new(entity).form(params, &block)
      end
    end

    def initialize(entity)
      @entity = entity
    end

    def form(form_params, &block)
      Tag.build('form', form_attributes(form_params)) do
        block&.call(self)
      end
    end

    def input(field_name, params = {})
      Tag.build(
        'input',
        name: field_name,
        **input_attributes(field_name, params)
      )
    end

    private

    def form_attributes(params)
      {
        action: params[:url] || '/',
        method: params[:method] || 'post',
        **params.except(:url, :method)
      }
    end

    def input_attributes(field_name, params)
      {
        type: params[:as] || 'text',
        value: @entity.public_send(field_name),
        **params.except(:as)
      }
    end
  end
end
