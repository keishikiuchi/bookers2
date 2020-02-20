Rails.application.routes.draw do
	root to: 'homes#index'
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
  resources :top, only:[:index]
  get '/home/about',to: 'homes#show'

  resources :homes, only: [:index, :create, :show, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
