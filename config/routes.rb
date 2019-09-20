Rails.application.routes.draw do
  get 'questions/top'
  root 'pages#index' 
  #　root でトップページのリンク先を指定する
  
  get 'sessions/new'
  
  get 'kindles/search'
  
  get 'favorites/top'
  get 'favorites/search' 
  get 'favorites/index'
  post 'favorites/:id/destroy' => 'favorites#destroy'
  
  get 'book_shelfs/top'
  get 'book_shelfs/search'

  post 'purchaseds/:book_id/state' => 'book_shelfs#state'
  post 'purchaseds/:book_id/default' => 'book_shelfs#default'
  post 'purchaseds/:book_id/destroy' => 'book_shelfs#destroy'

  get 'questions/top'
  get 'pages/index'
  
  resources :users
  resources :favorites
  resources :purchaseds
  resources :reeds
  resources :stores
  resources :sale_books
  resources :questions
  resources :book_shelfs
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
