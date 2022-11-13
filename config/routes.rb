Rails.application.routes.draw do
  root 'static_pages#home'
  get '/', to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/gallery', to: 'static_pages#gallery'
  namespace :admin do
    resources :guitars # move to namespace, as this will be under admin panel
  end
  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end
  post '/send_message', to: 'messages#send_message'
  get '/guitars/:guitar_id/images', to: 'images#index'
end
