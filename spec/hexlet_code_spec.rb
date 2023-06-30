# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength
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
      expect(form_for).to eq load_fixture('form_only.html')
    end

    context 'with textarea' do
      subject(:form_for) do
        described_class.form_for(entity, attributes) do |f|
          f.input :name, as: :text
          f.submit 'submit'
        end
      end

      it 'returns html form with textarea' do
        expect(form_for).to eq load_fixture('form_with_textarea.html')
      end
    end

    context 'with inputs' do
      subject(:form_for) do
        described_class.form_for(entity, attributes) do |f|
          f.input :name
          f.submit 'submit'
        end
      end

      it 'returns html form with inputs' do
        expect(form_for).to eq load_fixture('form_with_input.html')
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
