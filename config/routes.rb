Rails.application.routes.draw do
  resources :stores, only: %i[index show]
  resources :transactions, only: [] do
    collection do
      get :import, action: :import_form
      post :import, action: :import
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
