Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: 'homes#top'
  get "/home/about" =>"homes#about"
  get '/search', to: 'searchs#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
  resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
