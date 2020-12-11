Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, except: [:new, :edit, :update]
  resources :posts, except: [:index, :edit, :update]
end
