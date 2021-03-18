Rails.application.routes.draw do
  root to: 'cocktails#home'
  resources :doses

  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
