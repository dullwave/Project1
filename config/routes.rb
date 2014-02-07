Project1::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :locations do
    resources :projects
  end

  root to: 'home#index'
end
