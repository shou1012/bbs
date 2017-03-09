Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  get 'pages/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :my_threads do
    resources :comments, module: :my_threads
  end
end
