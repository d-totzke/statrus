Rails.application.routes.draw do
  root to: 'sessions#new'
  
  resource :sessions
  resources :current_statuses
  resources :statuses
  resources :users
  get "/login" => "users#login"
  get "/update_status" => "users#update_status"
  get "/current_status" => "users#current_status"
  get 'landing' => 'users#landing', as: 'landing'  
  get 'office_display' => 'users#office_display'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
