PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/comments/:id/vote', to: 'comments#vote', as: 'vote_comment'

  resources :posts, except: [:destroy] do
    member do  # /posts/:id/vote    pertain to individual members of resource
      post 'vote'
    end

    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update]
  
end
