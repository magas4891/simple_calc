# frozen_string_literal: true

RSpec.describe Calculation, type: :model do
  let(:calculation) { create(:calculation) }

  describe 'association' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to be_stored_in(collection: 'calculations') }
  end

  describe 'fields' do
    it { is_expected.to have_field(:field_a).of_type(Integer) }
    it { is_expected.to have_field(:field_b).of_type(Integer) }
    it { is_expected.to have_field(:operation).of_type(String) }
    it { is_expected.to have_field(:result).of_type(Integer) }
    it { is_expected.to have_field(:count).of_type(Integer).with_default_value_of(0) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:field_a) }
    it { is_expected.to validate_presence_of(:field_b) }
    it { expect(described_class::OPERATIONS).to contain_exactly(*%i[+ - / *]) }
  end

  describe 'db model' do
    before { calculation }

    it 'has one after adding one' do
      expect(described_class.count).to eq(1)
    end
  end
end
