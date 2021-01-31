Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'user', to: 'users#index'
      get 'health_check', to: 'health_checks#index'
    end
  end
end
