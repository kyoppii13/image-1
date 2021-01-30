Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'test', to: 'users#test'
    end
  end
end
