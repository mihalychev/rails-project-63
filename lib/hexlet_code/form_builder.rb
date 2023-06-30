# frozen_string_literal: true

module HexletCode
  class FormBuilder
    class << self
      def build(entity, params, template_engine = Tags::HtmlTag, &block)
        new(entity, template_engine).form(params, &block)
      end
    end

    def initialize(entity, template_engine)
      @entity = entity
      @body = ''

      @template_engine = template_engine
    end

    def form(form_params, &block)
      @template_engine.build('form', form_attributes(form_params)) do
        block&.call(self)
      end
    end

    def input(field_name, params = {})
      @body += build_label(field_name)
      @body += if params[:as] == :text
                 build_textarea(field_name, params)
               else
                 build_input(field_name, params)
               end
    end

    def submit(value = 'Save')
      @body += build_submit(value)
    end

    private

    def build_label(field_name)
      @template_engine.build('label', for: field_name) { field_name.capitalize }
    end

    def build_input(field_name, params)
      @template_engine.build(
        'input',
        name: field_name,
        **input_attributes(field_name, params)
      )
    end

    def build_textarea(field_name, params)
      @template_engine.build(
        'textarea',
        name: field_name,
        **textarea_attributes(params)
      ) { @entity.public_send(field_name) }
    end

    def build_submit(value)
      @template_engine.build('input', type: 'submit', value: value)
    end

    def form_attributes(params)
      {
        action: params[:url] || '/',
        method: params[:method] || 'post',
        **params.except(:url, :method)
      }
    end

    def textarea_attributes(params)
      {
        type: params[:type] || 'text',
        cols: params[:cols] || 20,
        rows: params[:rows] || 40,
        **params.except(:as)
      }
    end

    def input_attributes(field_name, params)
      {
        type: params[:type] || 'text',
        value: @entity.public_send(field_name),
        **params.except(:as)
      }
    end
  end
end
