BnbTest::Application.routes.draw do
  resources :categories, only: :index
  resources :notes do
    put 'star', :on => :member, :as => 'star'
  end

  root to: 'home#index'
  match 'about', to: 'home#about', as: 'about'
  match 'install', to: 'home#install', as: 'install'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'logout', to: 'sessions#destroy', as: 'logout'
end
