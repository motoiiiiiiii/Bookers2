Rails.application.routes.draw do
  devise_for :users
  root 'books#home'
  get 'users/:id' =>'users#show', as: 'user'
  get 'users/:id/edit' =>'users#edit', as: 'edit_user'
  patch 'users/:id' => 'users#update', as: 'update_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
