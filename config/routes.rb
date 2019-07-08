Rails.application.routes.draw do
  devise_for :users
  root 'proverbs#index'
  resources :proverbs do
    resources :comments, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  
  # delete 'proverbs/proverb_id/comments/:id' => 'comments#destroy'
  
  # get 'proverbs' => 'proverbs#index'
  # get 'proverbs/new' => 'proverbs#new'
  # post 'proverbs' => 'proverbs#create'
  # get 'users/:id' => 'users#show'
  # delete 'proverbs/:id' => 'proverbs#destroy'
  # get 'proverbs/:id/edit' => 'proverbs#edit'
  # patch 'proverbs/:id' => 'proverbs#update'
  # get 'proverbs/:id' => 'proverbs#show'
end
