Rails.application.routes.draw do
  resources :confirm, only: [:confirm]
  root 'users#new'
 #resources :confirm, only: %i[new create edit update]
  post 'users/create'=>'users#create',as: 'users'
  get 'sessions/new'=>'sessions#new',as: 'login'
  post'sessions/create'=>'sessions#create',as: 'login_c'
  put 'activate/:mail'=>'auth#activate_user',as: 'activate_user'
  get 'confirm/:mail'=>'auth#confirm',as: 'confirm'
  get 'users/:id'=>'users#show',as: 'users_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
