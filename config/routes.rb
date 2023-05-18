Rails.application.routes.draw do
  root to: 'tasks#index'
  delete 'tasks/:id/destroy' => 'tasks#destroy', as: 'articles_destroy'
  resources :tasks do
    member do
      post :done
    end
  end
end
