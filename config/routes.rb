Rails.application.routes.draw do
  devise_for :people
  root 'top#index'

  resources :job_offers

  resources :circles do
    resources :job_offers do
      resources :messages
    end
  end

  namespace :admin do
    get 'login' => ''
    get 'dashboard' => 'dashboard#index'
    resource  :organization, only: %i[show edit update]
    resources :users
    resources :circles do
      resources :members
    end
    resources :job_offers
  end
end
