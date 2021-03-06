Rails.application.routes.draw do
  
  devise_for :users
  resources :comments, only: [:edit, :create, :destroy, :update]

  resources :blog_posts

  root 'blog_posts#index'

  get '/:name' => 'blog_posts#user_posts', as: :user_posts

  get 'index' => 'practice#index'

  post 'index' => 'practice#index'

  get 'about' => 'practice#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
