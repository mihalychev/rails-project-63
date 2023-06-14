# frozen_string_literal: true

RSpec.describe HexletCode do
  it 'has a version number' do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe '.form_for' do
    subject(:form_for) { described_class.form_for(entity, attributes) }

    let(:user_struct) { Struct.new(:name, keyword_init: true) }
    let(:entity) { user_struct.new(name: 'rob') }
    let(:attributes) { { url: '/users', abc: 'hehwtf' } }

    it 'returns html form tag with attributes' do
      expect(form_for).to eq '<form action="/users" method="post" abc="hehwtf"></form>'
    end
  end
end
