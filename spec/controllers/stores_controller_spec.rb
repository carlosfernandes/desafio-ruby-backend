require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe 'GET index' do
    let!(:stores) { create_list(:store, 2) }

    it 'render stores' do
      get :index

      expect(assigns[:stores]).to have(2).items
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    let!(:store) { create(:store) }

    it 'render stores' do
      get :show, params: { id: store.id }

      expect(assigns[:store]).to eq(store)
      expect(response).to render_template('show')
    end
  end
end
