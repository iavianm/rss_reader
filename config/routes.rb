Rails.application.routes.draw do
  root 'news#index'
  resources :news
  resources :channels
end
