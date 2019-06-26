Rails.application.routes.draw do
  root 'proverbs#index'
  get 'proverbs' => 'proverbs#index'
  get 'proverbs/new' => 'proverbs#new'
  post 'proverbs' => 'proverbs#create'
end
