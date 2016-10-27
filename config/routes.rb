Rails.application.routes.draw do
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  resources :trades
  post "trades/new" 
  
end
