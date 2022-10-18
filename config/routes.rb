Rails.application.routes.draw do
  apipie
  resources :devices
  resources :sites

  namespace :api do
    namespace :v1 do
      resources :sites do 
        resources :devices do
        end
      end
    end
  end
end
