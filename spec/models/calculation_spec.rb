# frozen_string_literal: true

RSpec.describe Calculation, type: :model do
  let(:calculation) { create(:calculation) }

  describe 'association' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to be_stored_in(collection: 'calculations') }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:field_a) }
    it { is_expected.to validate_presence_of(:field_b) }
  end

  describe 'field presence' do
    it { is_expected.to have_fields(:field_a, :field_b, :operation, :result).of_type(String) }
  end

  describe '#sum' do
    it 'returns exact value' do
      calc = described_class.sum('6', '2')
      expect(calc).to eq(8)
    end
  end

  describe '#sub' do
    it 'returns exact value' do
      calc = described_class.sub('6', '2')
      expect(calc).to eq(4)
    end
  end

  describe '#mul' do
    it 'returns exact value' do
      calc = described_class.mul('6', '2')
      expect(calc).to eq(12)
    end
  end

  describe '#div' do
    it 'returns exact value' do
      calc = described_class.div('6', '2')
      expect(calc).to eq(3)
    end
  end

  describe 'db model' do
    before { calculation }

    it 'has one after adding one' do
      expect(described_class.count).to eq(1)
    end
  end
end
