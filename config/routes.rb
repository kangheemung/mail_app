Rails.application.routes.draw do
  root 'users#new'
 
  post 'users/creat'=>'users#create',as: 'users'
  get 'sessions/new'=>'sessions#new',as: 'login'
  post'sessions/create'=>'sessions#create',as: 'login_c'
  get 'users/:id'=>'users#show',as: 'users_show'
  get 'confirm/:id'=>'auth#confirm',as: 'confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
