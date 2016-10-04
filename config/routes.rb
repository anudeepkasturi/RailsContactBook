Rails.application.routes.draw do
  resources :users do
    resources :contacts
    get '/favorites', to: 'contacts#favorites'
    get '/groups', to: 'contacts#groups'
  end
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :contact_shares
end
