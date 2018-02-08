Rails.application.routes.draw do

  root 'items#index'

  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  resources :users, only: [] do
    resources :items, only: [:new, :create]
  end

  get 'items/new'

  #root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
