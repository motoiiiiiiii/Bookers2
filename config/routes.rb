Rails.application.routes.draw do
  devise_for :users
  root 'books#home'
  get 'home/about' =>'home#about', as: 'about'
  get 'users/:id' =>'users#show', as: 'user'
  get 'users/:id/edit' =>'users#edit', as: 'edit_user'
  get 'users' =>'users#index', as:'users'
  get 'books' =>'books#index', as: 'books'
  get 'books/:id' =>'books#show', as:'book'
  get 'books/:id/edit' =>'books#edit', as:'edit_book'
  post 'books'=>'books#create'
  patch 'users/:id' => 'users#update', as: 'update_user'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
