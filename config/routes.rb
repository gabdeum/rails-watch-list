Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[create]
  end
  root "lists#index"

  resources :bookmarks, only: %i[show]
  delete "bookmarks/:id", to: "bookmarks#destroy"
end
