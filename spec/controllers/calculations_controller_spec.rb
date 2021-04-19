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
    it 'increases Calculation.count by 1' do
      expect { send_request }.to change { Calculation.count }.from(0).to(1)
    end

    context 'after sending request' do
      before { send_request }

      it 'has assigned value' do
        prev_calc = assigns(:prev_calc)
        expect(prev_calc[:result]).to eq('15')
      end
      it 'returns successful response' do
        expect(response).to be_successful
      end
      it 'renders create template' do
        expect(response).to render_template('create')
      end
    end

    context 'after invalid_request' do
      before { send_invalid_request }

      it 'has flash error message' do
        expect(flash['error']).to eq("Field b can't be blank")
      end
    end
  end
end
