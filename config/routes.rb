Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:index, :show, :create, :update, :destroy] do
        resource :kind, controller: 'contact_kind', only: [:show]

        resource :phones, controller: 'contact_phones', only: [:show]

        resource :address, controller: 'contact_address', only: [:show]
      end

      resources :kinds, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
