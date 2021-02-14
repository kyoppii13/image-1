Rails.application.routes.draw do
  namespace 'api' do
    get 'users/mypage', to: 'users#mypage'
    post 'users', to: 'users#create'
    get 'users/:id', to: 'users#show'
    get 'users/:user_id/questions', to: 'questions#index'
    get 'users/:user_id/questions/:id', to: 'questions#show'

    resources :questions, only: [:index, :show, :create]
    get 'health_check', to: 'health_checks#index'
  end
end
