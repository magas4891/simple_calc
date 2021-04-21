# frozen_string_literal: true

RSpec.describe CalculationsController, type: :controller do
  let(:calculation_attributes) { attributes_for(:calculation) }
  let(:send_request) { post :create, params: { calculation: calculation_attributes }, format: :js }
  let(:send_invalid_request) do
    post :create, params: { calculation: calculation_attributes.merge(field_b: nil) }, format: :js
  end

  describe 'GET #index' do
    before { get :index }
    it 'should returns successful response' do
      expect(response).to be_successful
    end
    it 'should render index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'when calculation is new' do
      it 'increases Calculation.count by 1' do
        expect { send_request }.to change { Calculation.count }.from(0).to(1)
      end

      context 'after sending request' do
        before { send_request }

        it 'has result equal to 15 and count equal to 1' do
          calc = assigns(:calculation)
          expect(calc.result).to eq(15)
          expect(calc.count).to eq(1)
        end
        it 'returns successful response' do
          expect(response).to be_successful
        end
        it 'renders create template' do
          expect(response).to render_template('create')
        end
      end
    end

    context 'when calculation exists' do
      let!(:calculation) { create(:calculation) }

      it 'increases Calculation.count by 1' do
        expect { send_request }.not_to change { Calculation.count }
      end

      context 'after sending request' do
        before { send_request }

        it 'returns exists record' do
          calc = assigns(:calculation)
          expect(calc.id).to eq(calculation.id)
        end
        it 'returns successful response' do
          expect(response).to be_successful
        end
        it 'renders create template' do
          expect(response).to render_template('create')
        end
      end
    end

    context 'after invalid_request' do
      before { send_invalid_request }

      it 'has flash error message' do
        expect(flash['error']).to eq('Fill in all inputs!')
      end
    end
  end
end
