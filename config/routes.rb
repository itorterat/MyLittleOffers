Rails.application.routes.draw do

  root to: "offers#index"

  devise_for :users

  resources :offers, only: %i[index new show create update] do
    resources :comments, only: %i[create show], module: 'offers'
  end
  patch '/offers' => 'offers#update'

end
