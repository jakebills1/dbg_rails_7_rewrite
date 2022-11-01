Rails.application.routes.draw do
  root 'static_pages#home'
  get '/', to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # namespace :api do
  #   resources :guitars
  # end
  resources :guitars
  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
  post '/send_message', to: 'messages#send_message'
end
