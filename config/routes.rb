Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:index, :show, :create, :update, :destroy] do
        resource :kind, only: :show, controller: 'contact_kind'
        resource :kind, only: :show, controller: 'contact_kind', path: 'relationships/kind'

        resource :phones, only: :show, controller: 'contact_phones'
        resource :phones, only: :show, controller: 'contact_phones', path: 'relationships/phones'

        resource :phone, only: [:update, :create, :destroy], controller: 'contact_phones'
        resource :phone, only: [:update, :create, :destroy], controller: 'contact_phones', path: 'relationships/phones'

        resource :address, only: [:show, :update, :create, :destroy], controller: 'contact_address'
        resource :address, only: [:show, :update, :create, :destroy], controller: 'contact_address', path: 'relationships/address'
      end

      resources :kinds, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
