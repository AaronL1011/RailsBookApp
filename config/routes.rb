Rails.application.routes.draw do 
  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  post "/books", to: "books#create"
  put "/books/:id", to: "books#update"
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"

  get "/products", to: "products#index"

  get "/", to: "pages#index"
end
