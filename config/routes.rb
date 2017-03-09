Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :my_threads do
    resources :comments, module: :my_threads
  end

  root 'my_threads#index'

end
