# frozen_string_literal: true

RSpec.describe HexletCode::Tags::HtmlTag do
  describe '.build' do
    context 'with single tag' do
      subject { described_class.build(tag, attributes) }

      let(:tag) { 'img' }
      let(:attributes) { { src: 'http://some_url.com/img/1' } }

      it 'returns single html tag' do
        expect(subject).to eq '<img src="http://some_url.com/img/1">'
      end
    end

    context 'with double tag' do
      subject { described_class.build(tag, attributes) { value } }

      let(:tag) { 'label' }
      let(:attributes) { { for: 'email' } }
      let(:value) { 'Email' }

      it 'returns double html tag' do
        expect(subject).to eq '<label for="email">Email</label>'
      end
    end
  end
end
