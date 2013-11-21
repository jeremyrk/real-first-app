

Bloccit::Application.routes.draw do

  get "comments/create"
  # get "topics/index"
  # get "topics/new"
  # get "topics/show"
  # get "topics/edit"
  
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      get '/up-vote', to: 'votes#up_vote', as: :up_vote
      get '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end


########################################

#####    OLD

# Bloccit::Application.routes.draw do
  # get "comments/create"
  # get "topics/index"
  # get "topics/new"
  # get "topics/show"
  # get "topics/edit"
#  devise_for :users
#   get "posts/index"
#   get "posts/show"
#   get "posts/new"
#   get "posts/edit"
#   get "welcome/index"
#   get "welcome/about"
  
#   root to: 'welcome#index'
# end
