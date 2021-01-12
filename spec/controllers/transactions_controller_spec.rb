require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET import' do
    it 'render form template' do
      get :import_form
      expect(response).to render_template('import')
    end
  end

  describe 'POST import' do
    subject do
      params = {
        upload: {
          file: Rack::Test::UploadedFile.new(File.new(Rails.root.join('spec/fixtures/CNAB-single.txt')))
        }
      }

      post :import, params: params
    end

    it 'import transactions' do
      expect{ subject }.to change{ Transaction.count }.by(1)
        .and change{ Store.count }.by(1)

      expect(response).to redirect_to(import_transactions_path)
    end
  end
end
