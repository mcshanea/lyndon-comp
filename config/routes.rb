Rails.application.routes.draw do
  resources :prizes do
    member { post :generate_winner }
  end
  resources :applicants  do
    collection { post :import }
    delete :destroy_all, on: :collection
  end
  resources :competitions
  get 'hello_world/index'
  root 'hello_world#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
