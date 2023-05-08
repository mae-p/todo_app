Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    member do
      post :done
    end
  end
end
