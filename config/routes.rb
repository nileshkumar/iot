Rails.application.routes.draw do
  resources :sites

  namespace :api do
    namespace :v1 do
      resources :sites, defaults: { format: :json }
    end
  end
end
