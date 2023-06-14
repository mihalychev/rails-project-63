# frozen_string_literal: true

module HexletCode
  autoload(:VERSION, 'hexlet_code/version.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')

  def self.form_for(_entity, params = {}, &_block)
    Tag.build('form', action: params[:url], method: params[:method] || 'post', **params.except(:url, :method))
  end
end
