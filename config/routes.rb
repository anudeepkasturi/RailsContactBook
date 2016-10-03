Rails.application.routes.draw do
  resources :users do
    resources :contacts
  end
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :contact_shares
end
