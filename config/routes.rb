Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'

  get '/greenhouses' => 'greenhouses#index'
  get '/hydroponics' => 'hydroponics#index'
  get '/hydroponics/show' => 'hydroponics#show'

  authenticate :user, lambda { |u| u.admin == true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  namespace :api do
    namespace :v1 do
      resources :hydroponics_data do
        get '/last_data' => 'hydroponics_data#last_data', on: :collection
      end
      resources :hydroponics
      post '/sessions/authenticate' => 'session#authenticate'
    end
  end
end
