Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#top"
  root "users#top"
  resources :users, only:[:show, :edit, :update]
  resources :posts do
  	resources :post_comments, only:[:create, :destroy]
  	resource :favorites, only:[:create, :destroy]
  end

end
