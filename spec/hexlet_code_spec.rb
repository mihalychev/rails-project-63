# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength
RSpec.describe HexletCode do
  it 'has a version number' do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe '.form_for' do
    subject(:form_for) { described_class.form_for(entity, attributes) }

    let(:user_struct) { Struct.new(:name, :bio, keyword_init: true) }
    let(:entity) { user_struct.new(name: 'rob', bio: 'some text') }
    let(:attributes) { { class: 'form' } }

    context 'without inputs and custom url' do
      it 'returns html form tag with default url' do
        expect(form_for).to eq load_fixture('form_only_with_default_url.html')
      end
    end

    context 'without inputs and custom url' do
      let(:attributes) { { url: '/users', class: 'form' } }

      it 'returns html form tag with custom url' do
        expect(form_for).to eq load_fixture('form_only_with_custom_url.html')
      end
    end

    context 'with textarea' do
      subject(:form_for) do
        described_class.form_for(entity, attributes) do |f|
          f.input :name, as: :text
        end
      end

      it 'returns html form with textarea' do
        expect(form_for).to eq load_fixture('form_with_textarea.html')
      end
    end

    context 'with input' do
      subject(:form_for) do
        described_class.form_for(entity, attributes) do |f|
          f.input :name
        end
      end

      it 'returns html form with input' do
        expect(form_for).to eq load_fixture('form_with_input.html')
      end
    end

    context 'with submit' do
      subject(:form_for) do
        described_class.form_for(entity, attributes, &:submit)
      end

      it 'returns html form with submit' do
        expect(form_for).to eq load_fixture('form_with_submit.html')
      end
    end

    context 'with all tags' do
      subject(:form_for) do
        described_class.form_for(entity, attributes) do |f|
          f.input :name
          f.input :bio, as: :text
          f.submit
        end
      end

      it 'returns html form with all tags' do
        expect(form_for).to eq load_fixture('form_with_all_tags.html')
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
