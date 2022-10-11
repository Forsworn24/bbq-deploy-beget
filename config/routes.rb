Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :subscriptions
  resources :comments
  
  root to: "events#index"

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]

    post :show, on: :member
  end

  resources :users, only: %i[show edit update]

  get '/events/:event_id/subscriptions', to: redirect('/events/%{event_id}')
end
